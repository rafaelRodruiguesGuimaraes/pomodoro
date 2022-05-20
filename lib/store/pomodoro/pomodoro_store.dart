import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum IntervalType { working, resting }

abstract class _PomodoroStore with Store {
  @observable
  bool isRunning = false;

  @observable
  int minutes = 0;

  @observable
  int seconds = 0;

  @observable
  int workTime = 0;

  @observable
  int restTime = 0;

  @observable
  IntervalType intervalType = IntervalType.resting;

  @action
  void startStop() {
    isRunning = !isRunning;
  }

  @action
  void restart() {
    isRunning = false;
    minutes = 0;
    seconds = 0;
    workTime = 0;
    restTime = 0;
  }

  @action
  void incrementWorkTime() {
    workTime++;
  }

  @action
  void decrementWorkTime() {
    workTime <= 0 ? null : workTime--;
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
}
