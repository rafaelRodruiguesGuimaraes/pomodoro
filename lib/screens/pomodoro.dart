import 'package:flutter/material.dart';
import 'package:pomodoro/store/counter.store.dart';

import '../components/pomodoro_stopwatch.dart';
import '../components/time_input.dart';

class Pomodoro extends StatelessWidget {
  Pomodoro({Key? key}) : super(key: key);

  final store = CounterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: PomodoroStopwatch(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: const [
                    TimeInput(
                      title: 'Trabalho',
                      value: 25,
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    TimeInput(
                      title: 'Descanso',
                      value: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
