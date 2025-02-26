

import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/models/score_card_model/score_card_model.dart';

class ScoreCardState extends Equatable {
  final ApiResponse<scoreCardModel> scoreCard;

  const ScoreCardState({required this.scoreCard});

  ScoreCardState copyWith({ApiResponse<scoreCardModel>? scoreCard}) {
    return ScoreCardState(scoreCard: scoreCard ?? this.scoreCard);
  }

  @override
  List<Object?> get props => [scoreCard];
}
