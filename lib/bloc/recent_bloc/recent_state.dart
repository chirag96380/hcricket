

import 'package:hcricket/bloc/bloc_exports.dart';


import '../../models/recent_model/recent_model.dart';

class RecentState extends Equatable {
  final ApiResponse<RecentModel> recentMatches;

  const RecentState({required this.recentMatches});

  RecentState copyWith({ApiResponse<RecentModel>? recentMatches}) {
    return RecentState(recentMatches: recentMatches ?? this.recentMatches);
  }

  @override
  List<Object?> get props => [recentMatches];
}
