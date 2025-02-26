
import 'package:hcricket/bloc/bloc_exports.dart';

abstract class ScoreCardEvent extends Equatable {
  const ScoreCardEvent();

  @override
  List<Object?> get props => [];
}

class GetScoreCard extends ScoreCardEvent {}
