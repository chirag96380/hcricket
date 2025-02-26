import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/models/news_model/news_model.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository;
  String? lastNewsId;
  bool isFetching = false;

  NewsBloc({required this.newsRepository})
      : super(const NewsState(allListNews: ApiResponse.loading())) {
    on<GetAllNews>(allNewsList);
  }

  Future<void> allNewsList(GetAllNews event, Emitter<NewsState> emit) async {
    if (isFetching) return; // Prevent multiple requests
    isFetching = true;

    final newNews = await newsRepository.getAllNewsApi(lastId: lastNewsId);

    // **Last news ID update** for pagination
    lastNewsId = newNews.storyList.isNotEmpty
        ? newNews.storyList.last.story?.id.toString()
        : lastNewsId;

    // **Merging old and new news**
    List<StoryItem> updatedList = [
      ...state.allListNews.data?.storyList ?? [], // Purana data
      ...newNews.storyList // Naya data
    ];

    emit(state.copyWith(
        allListNews: ApiResponse.completed(NewsModel(
      storyList: updatedList,
      appIndex: newNews.appIndex,
      lastUpdatedTime: DateTime.now().millisecondsSinceEpoch.toString(),
    ))));

    isFetching = false;
  }
}
