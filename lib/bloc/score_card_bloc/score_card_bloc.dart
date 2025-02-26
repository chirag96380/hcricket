import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/bloc/score_card_bloc/score_card_event.dart';
import 'package:hcricket/bloc/score_card_bloc/score_card_state.dart';

class ScoreCardBloc extends Bloc<ScoreCardEvent, ScoreCardState> {
  ScoreCardRepository scoreCardRepository;

  ScoreCardBloc({required this.scoreCardRepository})
      : super(const ScoreCardState(scoreCard: ApiResponse.loading())) {
    on<GetScoreCard>(_getScoreCard);
  }

  Future<void> _getScoreCard(
      GetScoreCard event, Emitter<ScoreCardState> emit) async {
    final value = await scoreCardRepository.getScoreCardApi();
    emit(state.copyWith(scoreCard: ApiResponse.completed(value)));
  }
}
