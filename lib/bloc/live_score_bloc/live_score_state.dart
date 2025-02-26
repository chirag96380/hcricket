import 'package:hcricket/bloc/bloc_exports.dart';

class LiveScoreState extends Equatable {
  final ApiResponse<LiveScoreModel> liveScoreList;
  final int currentIndex;

  const LiveScoreState({required this.liveScoreList, this.currentIndex = 0});

  LiveScoreState copyWith(
      {ApiResponse<LiveScoreModel>? liveScoreList, int? currentIndex}) {
    return LiveScoreState(
      liveScoreList: liveScoreList ?? this.liveScoreList,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [liveScoreList, currentIndex];
}
