import 'package:hcricket/bloc/bloc_exports.dart';

class NewsDetailBloc extends Bloc<NewsDetailEvent, NewsDetailState> {
  final NewsDetailRepository newsDetailRepository;

  NewsDetailBloc({required this.newsDetailRepository})
      : super(const NewsDetailState(allNewsDetail: ApiResponse.loading())) {
    on<GetAllDetailNews>(allNewsDetailList);
  }

  Future<void> allNewsDetailList(
      GetAllDetailNews event, Emitter<NewsDetailState> emit) async {
    final value = await newsDetailRepository.getAllDetailNewsApi(event.newsId);

    // Debugging the full response

    if (value.content.isEmpty) {
    } else {}

    emit(state.copyWith(allNewsDetail: ApiResponse.completed(value)));
  }
}

abstract class NewsDetailEvent extends Equatable {
  const NewsDetailEvent();

  @override
  List<Object?> get props => [];
}

class GetAllDetailNews extends NewsDetailEvent {
  final int newsId;
  const GetAllDetailNews(this.newsId);

  @override
  List<Object?> get props => [newsId];
}
