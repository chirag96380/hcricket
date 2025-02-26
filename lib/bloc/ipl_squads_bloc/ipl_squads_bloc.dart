

import 'package:hcricket/bloc/ipl_squads_bloc/ipl_squads_event.dart';
import 'package:hcricket/bloc/ipl_squads_bloc/ipl_squads_state.dart';
import 'package:hcricket/data/response/api_response.dart';
import 'package:hcricket/repositery/match_repository.dart';
import 'package:hcricket/views/view.dart';

class IplSquadsBloc extends Bloc<IplSquadsEvent, IplSquadsState> {
  IplSquadRepository iplSquadRepository;

  IplSquadsBloc({required this.iplSquadRepository})
      : super(const IplSquadsState(allSquadsList: ApiResponse.loading())) {
    on<GetAllSquadsList>(allSeriesList);
  }

  Future<void> allSeriesList(
      GetAllSquadsList event, Emitter<IplSquadsState> emit) async {
    await iplSquadRepository.getIplSquadsApi(event.matchId).then((value) {
      emit(state.copyWith(allSquadsList: ApiResponse.completed(value)));
    });
  }
}
