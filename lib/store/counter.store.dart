import 'package:mobx/mobx.dart';

part 'counter.store.g.dart';

class CounterStore = _CounterStore with _$CounterStore;

abstract class _CounterStore with Store {
  @observable
  int count = 0;

  @action
  void increment() {
    count++;
  }
}
