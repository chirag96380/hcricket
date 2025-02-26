import 'package:equatable/equatable.dart';

abstract class MatchOverEvent extends Equatable {
  const MatchOverEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllOverList extends MatchOverEvent {}
