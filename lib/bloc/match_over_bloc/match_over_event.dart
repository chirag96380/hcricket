import 'package:equatable/equatable.dart';

abstract class MatchOverEvent extends Equatable {
  const MatchOverEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllOverList extends MatchOverEvent {
  final int matchId;
  final int endDate;
  final int inning;

  GetAllOverList(this.matchId, this.endDate, this.inning);

  @override
  List<Object?> get props => [matchId, endDate, inning];
}
