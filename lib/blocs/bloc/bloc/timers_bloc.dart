import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import 'package:odoo_apexive/models/timer_model.dart';

import 'package:odoo_apexive/services/test_data.dart';

part 'timers_event.dart';

part 'timers_state.dart';

class TimersBloc extends Bloc<TimersEvent, TimersState> {
  TimersBloc() : super(const TimersState()) {
    on<FetchTimers>(_onFetchTimers);

    on<AddTimer>(_onAddTimer);

    on<UpdateTimerPausePlay>(_onUpdateTimerPlayPause);

    on<UpdateTimerMarkCompleted>(_onUpdateTimerMarkCompleted);

    on<IncrementOneSecondTimer>(_onIncrementOneSecondTimer);

    on<DeleteTimer>(_onDeleteTimer);

    on<SortTimersEvent>(_onSortTimer);
  }

  void _onFetchTimers(FetchTimers event, Emitter<TimersState> emit) {
    emit(TimersStateLoading());

    try {
      // Insert the API Call from backend here

      List<TimerModel> list = List.from(dummyDataTimer);

      if (event.isRecentFirst) {
        list.sort((a, b) => a.createdTimeStamp.compareTo(b.createdTimeStamp));
      } else {
        list.sort((a, b) => b.createdTimeStamp.compareTo(a.createdTimeStamp));
      }

      emit(TimersState(listTimers: list));
    } catch (e) {
      emit(TimersStateFailure());
    }
  }

  void _onAddTimer(AddTimer event, Emitter<TimersState> emit) {
    final state = this.state;

    emit(
      TimersState(
        listTimers: List.from(state.listTimers)..add(event.timerModel),
      ),
    );
  }

  void _onUpdateTimerPlayPause(
      UpdateTimerPausePlay event, Emitter<TimersState> emit) {
    final state = this.state;

    final int index =
        state.listTimers.indexWhere((e) => e.id == event.timerModel.id);

    List<TimerModel> listTimers = List.from(state.listTimers);

    listTimers[index] =
        listTimers[index].copyWith(isActive: !listTimers[index].isActive);

    emit(TimersState(listTimers: listTimers));
  }

  void _onIncrementOneSecondTimer(
      IncrementOneSecondTimer event, Emitter<TimersState> emit) {
    final state = this.state;

    final int index =
        state.listTimers.indexWhere((e) => e.id == event.timerModel.id);

    List<TimerModel> listTimers = List.from(state.listTimers);

    if (listTimers[index].isActive) {
      if (listTimers[index].totalDurationMs >
          listTimers[index].timeElapsedMs + 1000) {
        listTimers[index] = listTimers[index].copyWith(
          timeElapsedMs: listTimers[index].timeElapsedMs + 1000,
          isActive: true,
        );
      } else {
        listTimers[index] = listTimers[index].copyWith(
          timeElapsedMs: listTimers[index].totalDurationMs,
          isActive: false,
          isCompleted: true,
        );
      }
    }

    emit(TimersState(listTimers: listTimers));
  }

  void _onUpdateTimerMarkCompleted(
      UpdateTimerMarkCompleted event, Emitter<TimersState> emit) {
    final state = this.state;

    final int index =
        state.listTimers.indexWhere((e) => e.id == event.timerModel.id);

    List<TimerModel> listTimers = List.from(state.listTimers);

    listTimers[index] =
        listTimers[index].copyWith(isActive: false, isCompleted: true);

    emit(TimersState(listTimers: listTimers));
  }

  void _onDeleteTimer(DeleteTimer event, Emitter<TimersState> emit) {
    final state = this.state;

    emit(TimersState(
        listTimers: List.from(state.listTimers)..remove(event.timerModel)));
  }

  void _onSortTimer(SortTimersEvent event, Emitter<TimersState> emit) {
    final state = this.state;

    List<TimerModel> list = state.listTimers;
    if (event.isRecentFirst) {
      list.sort((a, b) => a.createdTimeStamp.compareTo(b.createdTimeStamp));
    } else {
      list.sort((a, b) => b.createdTimeStamp.compareTo(a.createdTimeStamp));
    }

    emit(TimersState(
        listTimers: List.from(list), isRecentFirst: event.isRecentFirst));
  }
}
