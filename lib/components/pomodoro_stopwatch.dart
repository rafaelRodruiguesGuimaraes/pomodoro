import 'package:flutter/material.dart';
import 'package:pomodoro/components/stopwatch_button.dart';

class PomodoroStopwatch extends StatelessWidget {
  const PomodoroStopwatch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Time to work!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
            ),
          ),
          const Text(
            '00:47',
            style: TextStyle(
              color: Colors.white,
              fontSize: 100.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: StopwatchButton(
                  title: 'Start',
                  buttonIcon: Icons.play_arrow,
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(right: 10.0),
              //   child: StopwatchButton(
              //     title: 'Stop',
              //     buttonIcon: Icons.stop,
              //   ),
              // ),
              StopwatchButton(
                title: 'Restart',
                buttonIcon: Icons.refresh,
              )
            ],
          ),
        ],
      ),
    );
  }
}
