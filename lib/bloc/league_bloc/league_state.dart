import 'package:equatable/equatable.dart';
import 'package:hcricket/data/response/api_response.dart';
import 'package:hcricket/models/league_model/league_model.dart';

class LeagueState extends Equatable {
  final ApiResponse<LeagueModel> allLeague;

  const LeagueState({required this.allLeague});

  LeagueState copyWith({ApiResponse<LeagueModel>? allLeague}) {
    return LeagueState(allLeague: allLeague ?? this.allLeague);
  }

  @override
  List<Object?> get props => <Object?>[allLeague]; 
}
