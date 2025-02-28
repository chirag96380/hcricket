import 'package:hcricket/bloc/match_over_bloc/match_over_event.dart';
import 'package:hcricket/bloc/match_over_bloc/match_over_state.dart';
import 'package:hcricket/data/response/api_response.dart';
import 'package:hcricket/repositery/match_repository.dart';
import 'package:hcricket/widget/widgets_exports.dart';

class MatchOverBloc extends Bloc<MatchOverEvent, MatchOverState> {
  OverRepository overRepository;

  MatchOverBloc({required this.overRepository})
      : super(const MatchOverState(allOverList: ApiResponse.loading())) {
    on<GetAllOverList>(allOver);
  }

  Future<void> allOver(
      GetAllOverList event, Emitter<MatchOverState> emit) async {
    await overRepository
        .getOverApi(event.matchId, event.endDate, event.inning)
        .then((value) {
      emit(state.copyWith(allOverList: ApiResponse.completed(value)));
    });
  }
}
