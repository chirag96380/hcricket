import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hcricket/bloc/upcoming_matches_bloc/upcoming_matches_event.dart';
import 'package:hcricket/bloc/upcoming_matches_bloc/upcoming_matches_state.dart';
import 'package:hcricket/data/response/api_response.dart';
import 'package:hcricket/repositery/match_repository.dart';

class UpcomingMatchesBloc
    extends Bloc<UpcomingMatcehsEvent, UpcomingMatchesState> {
  UpcomingMatchesTabRepository upcomingMatchesTabRepository;

  UpcomingMatchesBloc({required this.upcomingMatchesTabRepository})
      : super(const UpcomingMatchesState(
            upcomingmatchList: ApiResponse.loading())) {
    on<GetUpcomingMatcehs>(_getUpcomingMatchesList);
  }

  Future<void> _getUpcomingMatchesList(
      GetUpcomingMatcehs event, Emitter<UpcomingMatchesState> emit) async {
    final value = await upcomingMatchesTabRepository.getUpcomingMatchesApi();

    if ((value.typeMatches?.isEmpty ?? true)) {}

    emit(state.copyWith(upcomingmatchList: ApiResponse.completed(value)));
  }
}
