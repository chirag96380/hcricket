import 'package:hcricket/bloc/bloc_exports.dart';

abstract class NewsDetailEvent extends Equatable {
  const NewsDetailEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllDetailNews extends NewsDetailEvent {
  final String newsId;

  const GetAllDetailNews(this.newsId);

  @override
  List<Object?> get props => [newsId];
}
