import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/models/squads_model/squads_model.dart';

class SquadsState extends Equatable {
  final ApiResponse<SquadsModel> squadsList;

  const SquadsState({required this.squadsList});

  SquadsState copyWith({ApiResponse<SquadsModel>? squadsList}) {
    return SquadsState(squadsList: squadsList ?? this.squadsList);
  }

  @override
  List<Object?> get props => [squadsList];
}
