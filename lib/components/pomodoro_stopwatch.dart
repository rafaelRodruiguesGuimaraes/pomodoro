import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/stopwatch_button.dart';
import 'package:pomodoro/store/pomodoro/pomodoro_store.dart';
import 'package:provider/provider.dart';

class PomodoroStopwatch extends StatelessWidget {
  const PomodoroStopwatch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Container(
      color: store.isWorking() ? Colors.red : Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            store.isWorking() ? 'Time to work!' : 'Time to Rest!',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32.0,
            ),
          ),
          Observer(
            builder: (_) => Text(
              '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 100.0,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Observer(
            builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                store.isRunning
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: StopwatchButton(
                          title: 'Start',
                          buttonIcon: Icons.play_arrow,
                          startStop: store.startStop,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: StopwatchButton(
                          title: 'Stop',
                          buttonIcon: Icons.stop,
                          startStop: store.startStop,
                        ),
                      ),
                StopwatchButton(
                  title: 'Restart',
                  buttonIcon: Icons.refresh,
                  startStop: store.restart,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
