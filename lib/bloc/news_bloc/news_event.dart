
import 'package:hcricket/bloc/bloc_exports.dart';


abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllNews extends NewsEvent {}
