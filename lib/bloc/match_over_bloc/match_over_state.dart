
import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/models/match_over_model/match_over_model.dart';

class MatchOverState extends Equatable {
  const MatchOverState({required this.allOverList});

  final ApiResponse<MatchOverModel> allOverList;

  MatchOverState copyWith({ApiResponse<MatchOverModel>? allOverList}) {
    return MatchOverState(allOverList: allOverList ?? this.allOverList);
  }

  @override
  List<Object?> get props => [allOverList];
}
