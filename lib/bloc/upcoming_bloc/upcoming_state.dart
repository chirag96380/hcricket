
import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/models/upcoming_model/upcoming_model.dart';


class UpcomingState extends Equatable {
  final ApiResponse<UpcomingModel> upcomingMatches;

  const UpcomingState({required this.upcomingMatches});

  UpcomingState copyWith({ApiResponse<UpcomingModel>? upcomingMatches}) {
    return UpcomingState(
        upcomingMatches: upcomingMatches ?? this.upcomingMatches);
  }

  @override
  List<Object?> get props => [upcomingMatches];
}
