import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum IntervalType { working, resting }

abstract class _PomodoroStore with Store {
  @observable
  bool isRunning = false;

  @observable
  int minutes = 1;

  @observable
  int seconds = 0;

  @observable
  int workTime = 1;

  @observable
  int restTime = 1;

  @observable
  IntervalType intervalType = IntervalType.resting;

  Timer? stopwatch;

  @action
  void start() {
    isRunning = true;

    stopwatch = Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        if (minutes == 0 && seconds == 0) {
          _changeIntervalType();
        } else if (seconds == 0) {
          seconds = 59;
          minutes--;
        } else {
          seconds--;
        }
      },
    );
  }

  @action
  void stop() {
    isRunning = false;
    stopwatch?.cancel();
  }

  @action
  void restart() {
    //minutes = isWorking() ? workTime : restTime;
    seconds = 0;
    stop();
  }

  @action
  void incrementWorkTime() {
    workTime++;
    minutes = workTime;
    if (isWorking()) {
      restart();
    }
  }

  @action
  void decrementWorkTime() {
    workTime <= 0 ? null : workTime--;
    minutes = workTime;
    if (isWorking()) {
      restart();
    }
  }

  @action
  void incrementRestTime() {
    restTime++;
  }

  @action
  void decrementRestTime() {
    restTime <= 0 ? null : restTime--;
  }

  bool isWorking() {
    return intervalType == IntervalType.working;
  }

  bool isResting() {
    return intervalType == IntervalType.resting;
  }

  void _changeIntervalType() {
    if (isWorking()) {
      intervalType = IntervalType.resting;
      minutes = restTime;
    } else {
      intervalType = IntervalType.working;
      minutes = workTime;
    }
    seconds = 0;
  }
}
