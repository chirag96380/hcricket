// import 'package:bloc/bloc.dart';
// import 'package:hcricket/bloc/match_series_bloc/match_series_event.dart';
// import 'package:hcricket/bloc/match_series_bloc/match_series_state.dart';
// import 'package:hcricket/data/response/api_response.dart';

// import '../../repositery/match_repository.dart';

// class MatchSeriesBloc extends Bloc<MatchSeriesEvent, MatchSeriesState> {
//   MatchRepository matchRepository;

//   MatchSeriesBloc({required this.matchRepository})
//       : super(const MatchSeriesState(allSeriesList: ApiResponse.loading())) {
//     on<GetAllSeriesList>(allSeriesList);
//   }

//   Future<void> allSeriesList(
//       GetAllSeriesList event, Emitter<MatchSeriesState> emit) async {
//     await matchRepository.getAllSeriesApi().then((value) {
//       emit(state.copyWith(allSeriesList: ApiResponse.completed(value)));
//     });
//   }
// }
