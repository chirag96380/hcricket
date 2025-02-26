

import 'package:hcricket/bloc/league_bloc/league_event.dart';
import 'package:hcricket/bloc/league_bloc/league_state.dart';
import 'package:hcricket/data/response/api_response.dart';
import 'package:hcricket/repositery/match_repository.dart';
import 'package:hcricket/views/view.dart';

class LeagueBloc extends Bloc<LeagueEvent, LeagueState> {
  LeagueRepository leagueRepository;

  LeagueBloc({required this.leagueRepository})
      : super(const LeagueState(allLeague: ApiResponse.loading())) {
    on<GetLeagueList>(allSeriesList);
  }

  Future<void> allSeriesList(
      GetLeagueList event, Emitter<LeagueState> emit) async {
    await leagueRepository.getLeagueApi().then((value) {
      emit(state.copyWith(allLeague: ApiResponse.completed(value)));
    });
  }
}
