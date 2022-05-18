import 'package:flutter/material.dart';
import 'package:pomodoro/store/counter.store.dart';

import '../components/time_input.dart';

class Pomodoro extends StatelessWidget {
  Pomodoro({Key? key}) : super(key: key);

  final store = CounterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Column(
        children: [
          const Text('Pomodoro'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const [
                  TimeInput(
                    title: 'Trabalho',
                    value: 25,
                  ),
                  TimeInput(
                    title: 'Descanso',
                    value: 25,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
