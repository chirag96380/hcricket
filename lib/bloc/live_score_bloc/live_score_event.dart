import 'package:hcricket/bloc/bloc_exports.dart';

abstract class LiveScoreEvent extends Equatable {
  const LiveScoreEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetLiveScore extends LiveScoreEvent {
  final bool forceRefresh;
  GetLiveScore({this.forceRefresh = false});
}

class UpdateCarouselIndex extends LiveScoreEvent {
  final int newIndex;

  const UpdateCarouselIndex(this.newIndex);

  @override
  List<Object?> get props => [newIndex];
}

class UpdateLiveScore extends LiveScoreEvent {
  final LiveScoreModel liveScoreModel;
  const UpdateLiveScore(this.liveScoreModel);

  @override
  List<Object?> get props => [liveScoreModel];
}
