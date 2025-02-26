import 'package:hcricket/bloc/bloc_exports.dart';

abstract class MatcheLeadbackEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetLeadBackList extends MatcheLeadbackEvent {
  final int matchId;

  GetLeadBackList(this.matchId);

  @override
  List<Object?> get props => [matchId];
}
