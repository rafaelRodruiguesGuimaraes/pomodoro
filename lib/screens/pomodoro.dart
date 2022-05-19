import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro/pomodoro_store.dart';
import 'package:provider/provider.dart';

import '../components/pomodoro_stopwatch.dart';
import '../components/time_input.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

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
                  children: [
                    Observer(
                      builder: ((_) => TimeInput(
                            title: 'Trabalho',
                            value: store.workTime,
                            incrementTime: store.incrementWorkTime,
                            decrementTime: store.decrementWorkTime,
                          )),
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    Observer(
                      builder: ((_) => TimeInput(
                            title: 'Descanso',
                            value: store.restTime,
                            incrementTime: store.incrementRestTime,
                            decrementTime: store.decrementRestTime,
                          )),
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
