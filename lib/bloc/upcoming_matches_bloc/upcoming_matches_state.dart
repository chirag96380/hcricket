import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/models/upcoming_matches_model/upcoming_matches_model.dart';

import 'package:equatable/equatable.dart';

// class UpcomingMatchesState extends Equatable {
//   final ApiResponse<UpcomingMatchesModel> upcomingmatchList;

//   const UpcomingMatchesState({required this.upcomingmatchList});

//   UpcomingMatchesState copyWith(
//       {ApiResponse<UpcomingMatchesModel>? upcomingmatchList}) {
//     return UpcomingMatchesState(
//         upcomingmatchList: upcomingmatchList ?? this.upcomingmatchList);
//   }

//   @override
//   List<Object?> get props => [upcomingmatchList];
// }

class UpcomingMatchesState extends Equatable {
  final ApiResponse<UpcomingMatchesModel> upcomingmatchList;

  const UpcomingMatchesState({required this.upcomingmatchList});

  UpcomingMatchesState copyWith({ApiResponse<UpcomingMatchesModel>? upcomingmatchList}) {
    return UpcomingMatchesState(
        upcomingmatchList: upcomingmatchList ?? this.upcomingmatchList);
  }

  @override
  List<Object?> get props => [upcomingmatchList];
}
