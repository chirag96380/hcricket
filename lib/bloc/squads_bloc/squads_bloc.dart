import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/bloc/squads_bloc/squads_event.dart';
import 'package:hcricket/bloc/squads_bloc/squads_state.dart';

class SquadsBloc extends Bloc<SquadsEvent, SquadsState> {
  SquadsRepository squadsRepository;

  SquadsBloc({required this.squadsRepository})
      : super(const SquadsState(squadsList: ApiResponse.loading())) {
    on<GetSquads>(_getSquads);
  }

  Future<void> _getSquads(
      GetSquads event, Emitter<SquadsState> emit) async {
    final value = await squadsRepository.getSquadsApi(event.matchId);
    emit(state.copyWith(squadsList: ApiResponse.completed(value)));
  }
}