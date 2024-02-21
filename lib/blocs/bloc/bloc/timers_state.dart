part of 'timers_bloc.dart';

class TimersState extends Equatable {
  final List<TimerModel> listTimers;
  final bool isRecentFirst;

  const TimersState({
    this.listTimers = const <TimerModel>[],
    this.isRecentFirst = true,
  });

  @override
  List<Object> get props => [listTimers];
}

final class TimersStateInitial extends TimersState {}

final class TimersStateLoading extends TimersState {}

final class TimersStateFailure extends TimersState {}
