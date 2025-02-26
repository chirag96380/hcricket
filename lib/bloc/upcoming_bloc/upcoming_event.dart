import 'package:equatable/equatable.dart';

abstract class UpcomingEvent extends Equatable {
  const UpcomingEvent();

  @override
  List<Object?> get props => [];
}

class GetUpcoming extends UpcomingEvent {}
