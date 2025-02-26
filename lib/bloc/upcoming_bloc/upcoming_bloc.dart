

import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/bloc/upcoming_bloc/upcoming_event.dart';
import 'package:hcricket/bloc/upcoming_bloc/upcoming_state.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  UpcomingMatchesRepository upcomingMatchesRepository;

  UpcomingBloc({required this.upcomingMatchesRepository})
      : super(const UpcomingState(upcomingMatches: ApiResponse.loading())) {
    on<GetUpcoming>(_getUpcomingMatches);
  }

  Future<void> _getUpcomingMatches(
      GetUpcoming event, Emitter<UpcomingState> emit) async {
    final value = await upcomingMatchesRepository.getUpcomingApi();
    emit(state.copyWith(upcomingMatches: ApiResponse.completed(value)));
  }
}
