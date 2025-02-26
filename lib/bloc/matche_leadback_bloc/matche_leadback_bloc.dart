import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/bloc/matche_leadback_bloc/matche_leadback_event.dart';
import 'package:hcricket/bloc/matche_leadback_bloc/matche_leadback_state.dart';

class MatcheLeadbackBloc
    extends Bloc<MatcheLeadbackEvent, MatcheLeadbackState> {
  LeadbackMatcheRepository leadbackMatcheRepository;

  MatcheLeadbackBloc({required this.leadbackMatcheRepository})
      : super(const MatcheLeadbackState(
            allLeadbackDetails: ApiResponse.loading())) {
    on<GetLeadBackList>(allLeadBackList);
  }

  Future<void> allLeadBackList(
      GetLeadBackList event, Emitter<MatcheLeadbackState> emit) async {
    await leadbackMatcheRepository.getLeadbackMatcheApi(event.matchId).then((value) {
      emit(state.copyWith(allLeadbackDetails: ApiResponse.completed(value)));
    });
  }
}
