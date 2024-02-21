part of 'timers_bloc.dart';

sealed class TimersEvent extends Equatable {
  final bool isRecentFirst;

  const TimersEvent({
    this.isRecentFirst = true,
  });

  @override
  List<Object> get props => [];
}

class FetchTimers extends TimersEvent {
  const FetchTimers();

  @override
  List<Object> get props => [];
}

class AddTimer extends TimersEvent {
  final TimerModel timerModel;

  const AddTimer({required this.timerModel});

  @override
  List<Object> get props => [timerModel];
}

class UpdateTimerPausePlay extends TimersEvent {
  final TimerModel timerModel;

  const UpdateTimerPausePlay({
    required this.timerModel,
  });

  @override
  List<Object> get props => [timerModel];
}

class UpdateTimerMarkCompleted extends TimersEvent {
  final TimerModel timerModel;

  const UpdateTimerMarkCompleted({
    required this.timerModel,
  });

  @override
  List<Object> get props => [timerModel];
}

class IncrementOneSecondTimer extends TimersEvent {
  final TimerModel timerModel;

  const IncrementOneSecondTimer({
    required this.timerModel,
  });

  @override
  List<Object> get props => [timerModel];
}

class DeleteTimer extends TimersEvent {
  final TimerModel timerModel;

  const DeleteTimer({required this.timerModel});

  @override
  List<Object> get props => [timerModel];
}

class SortTimersEvent extends TimersEvent {
  @override
  final bool isRecentFirst;

  const SortTimersEvent(this.isRecentFirst);

  @override
  List<Object> get props => [];
}
