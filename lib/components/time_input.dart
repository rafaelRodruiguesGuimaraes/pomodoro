import 'package:flutter/material.dart';

@immutable
class TimeInput extends StatelessWidget {
  const TimeInput({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text(
          value.toString(),
        )
      ],
    );
  }
}
