import 'package:equatable/equatable.dart';

abstract class UpcomingMatcehsEvent extends Equatable {
  const UpcomingMatcehsEvent();

  @override
  List<Object?> get props => [];
}

class GetUpcomingMatcehs extends UpcomingMatcehsEvent {}
