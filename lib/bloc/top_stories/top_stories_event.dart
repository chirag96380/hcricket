import 'package:hcricket/bloc/bloc_exports.dart';

abstract class TopStoriesEvent extends Equatable {
  const TopStoriesEvent();

  @override
  List<Object?> get props => [];
}

class GetTopSeries extends TopStoriesEvent {}
