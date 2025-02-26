import 'package:hcricket/bloc/bloc_exports.dart';

abstract class SquadsEvent extends Equatable {
  const SquadsEvent();

  @override
  List<Object?> get props => [];
}

class GetSquads extends SquadsEvent {}
