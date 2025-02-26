import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/models/top_stories_model/top_stories_model.dart';

class TopStoriesState extends Equatable {
  final ApiResponse<TopStoriesModel> topSeries;

  const TopStoriesState({required this.topSeries});

  TopStoriesState copyWith({ApiResponse<TopStoriesModel>? topSeries}) {
    return TopStoriesState(topSeries: topSeries ?? this.topSeries);
  }

  @override
  List<Object?> get props => [topSeries];
}

