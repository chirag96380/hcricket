
import 'package:hcricket/bloc/bloc_exports.dart';

abstract class RecentEvent extends Equatable {
  const RecentEvent();

  @override
  List<Object?> get props => [];
}

class GetRecent extends RecentEvent {}
