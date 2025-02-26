import 'package:hcricket/bloc/bloc_exports.dart';

abstract class MatcheInfoEvent extends Equatable {
  const MatcheInfoEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetMatcheInfo extends MatcheInfoEvent {}
