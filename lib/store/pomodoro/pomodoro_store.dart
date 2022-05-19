import 'package:mobx/mobx.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

abstract class _PomodoroStore with Store {
  @observable
  int workTime = 0;

  @observable
  int restTime = 0;

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
}
