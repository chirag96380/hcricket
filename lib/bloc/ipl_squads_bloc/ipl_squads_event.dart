import 'package:equatable/equatable.dart';

abstract class IplSquadsEvent extends Equatable {
  const IplSquadsEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllSquadsList extends IplSquadsEvent {
  final int matchId;

  GetAllSquadsList(this.matchId);

  @override
  List<Object?> get props => throw UnimplementedError();
}
