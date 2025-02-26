import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/models/match_info_model/match_info_model.dart';

class MatchInfoState extends Equatable {
  const MatchInfoState({required this.allMatchInfoList});

  final ApiResponse<MatchInfoModel> allMatchInfoList;

  MatchInfoState copyWith({ApiResponse<MatchInfoModel>? allMatchInfoList}) {
    return MatchInfoState(allMatchInfoList: allMatchInfoList ?? this.allMatchInfoList);
  }

  @override
  List<Object?> get props => [allMatchInfoList];
}
