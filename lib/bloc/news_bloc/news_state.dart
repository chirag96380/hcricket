import 'package:hcricket/bloc/bloc_exports.dart';
import 'package:hcricket/models/news_model/news_model.dart';

class NewsState extends Equatable {
  final ApiResponse<NewsModel> allListNews;

  const NewsState({required this.allListNews});

  NewsState copyWith({ApiResponse<NewsModel>? allListNews}) {
    return NewsState(allListNews: allListNews ?? this.allListNews);
  }

  @override
  List<Object?> get props => [allListNews];
}
