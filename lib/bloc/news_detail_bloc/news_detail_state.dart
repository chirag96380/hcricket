
import 'package:hcricket/bloc/bloc_exports.dart';


class NewsDetailState extends Equatable {
  final ApiResponse<CricketNewsDetail> allNewsDetail;

  const NewsDetailState({required this.allNewsDetail});

  NewsDetailState copyWith({ApiResponse<CricketNewsDetail>? allNewsDetail}) {
    return NewsDetailState(allNewsDetail: allNewsDetail ?? this.allNewsDetail);
  }

  @override
  List<Object?> get props => [allNewsDetail];
}
