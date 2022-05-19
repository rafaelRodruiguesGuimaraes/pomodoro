import 'package:flutter/material.dart';

@immutable
class TimeInput extends StatelessWidget {
  const TimeInput({
    Key? key,
    required this.title,
    required this.value,
    required this.incrementTime,
    required this.decrementTime,
  }) : super(key: key);

  final String title;
  final int value;
  final Function incrementTime;
  final Function decrementTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => incrementTime(),
              child: const Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(5.0),
                primary: Colors.green,
              ),
            ),
            Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
            ElevatedButton(
              onPressed: () => decrementTime(),
              child: const Icon(Icons.remove),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(5.0),
                primary: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
