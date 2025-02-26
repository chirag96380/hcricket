import 'package:hcricket/bloc/bloc_exports.dart';


class RecentBloc extends Bloc<RecentEvent, RecentState> {
  RecentMatchesRepository recentMatchesRepository;

  RecentBloc({required this.recentMatchesRepository})
      : super(const RecentState(recentMatches: ApiResponse.loading())) {
    on<GetRecent>(_getRecentMatches);
  }

  Future<void> _getRecentMatches(
      GetRecent event, Emitter<RecentState> emit) async {
    final value = await recentMatchesRepository.getRecentApi();
    emit(state.copyWith(recentMatches: ApiResponse.completed(value)));
  }
}
