import 'package:equatable/equatable.dart';
import 'package:hcricket/data/response/api_response.dart';
import 'package:hcricket/models/ipl_team_squad_model/ipl_team_squad_model.dart';

class IplSquadsState extends Equatable {
  const IplSquadsState({required this.allSquadsList});

  final ApiResponse<IplSquads> allSquadsList;

  IplSquadsState copyWith({ApiResponse<IplSquads>? allSquadsList}) {
    return IplSquadsState(allSquadsList: allSquadsList ?? this.allSquadsList);
  }

  @override
  List<Object?> get props => [allSquadsList];
}
