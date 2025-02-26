import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/models/matche_leadback_model/matche_leadback_model.dart';

class MatcheLeadbackState extends Equatable {
  final ApiResponse<LeanbackModel> allLeadbackDetails;

  const MatcheLeadbackState({required this.allLeadbackDetails});

  MatcheLeadbackState copyWith(
      {ApiResponse<LeanbackModel>? allLeadbackDetails}) {
    return MatcheLeadbackState(
        allLeadbackDetails: allLeadbackDetails ?? this.allLeadbackDetails);
  }

  @override
  List<Object?> get props => [allLeadbackDetails];
}
