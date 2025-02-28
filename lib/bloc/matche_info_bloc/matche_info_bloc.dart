import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/bloc/matche_info_bloc/matche_info_event.dart';
import 'package:hcricket/bloc/matche_info_bloc/matche_info_state.dart';

class MatchInfoBloc extends Bloc<MatcheInfoEvent, MatchInfoState> {
  MatcheInfoRepository matcheInfoRepository;

  MatchInfoBloc({required this.matcheInfoRepository})
      : super(const MatchInfoState(allMatchInfoList: ApiResponse.loading())) {
    on<GetMatcheInfo>(allSeriesList);
  }

  Future<void> allSeriesList(
      GetMatcheInfo event, Emitter<MatchInfoState> emit) async {
    await matcheInfoRepository.getMatchInfoApi(event.matchId).then((value) {
      emit(state.copyWith(allMatchInfoList: ApiResponse.completed(value)));
    });
  }
}
