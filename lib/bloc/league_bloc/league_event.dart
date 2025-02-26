import 'package:equatable/equatable.dart';

abstract class LeagueEvent extends Equatable {
  const LeagueEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetLeagueList extends LeagueEvent {}
