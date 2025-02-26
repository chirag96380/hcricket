import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/bloc/top_stories/top_stories_event.dart';
import 'package:hcricket/bloc/top_stories/top_stories_state.dart';

class TopStoriesBloc extends Bloc<TopStoriesEvent, TopStoriesState> {
  final TopStoriesRepository topStoriesRepository;

  TopStoriesBloc({required this.topStoriesRepository})
      : super(const TopStoriesState(topSeries: ApiResponse.loading())) {
    on<GetTopSeries>(_fetchTopStories);
  }

  Future<void> _fetchTopStories(
      GetTopSeries event, Emitter<TopStoriesState> emit) async {
    final response = await topStoriesRepository.getTopSeriesApi();
    emit(state.copyWith(topSeries: ApiResponse.completed(response)));
  }
}
