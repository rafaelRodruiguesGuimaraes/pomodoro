import 'package:flutter/material.dart';

class StopwatchButton extends StatelessWidget {
  const StopwatchButton({
    Key? key,
    required this.title,
    required this.buttonIcon,
    this.startStop,
  }) : super(key: key);

  final String title;
  final IconData buttonIcon;

  final void Function()? startStop;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        primary: Colors.black,
      ),
      onPressed: startStop,
      child: Row(
        children: [
          Icon(buttonIcon),
          const SizedBox(
            width: 5.0,
          ),
          Text(title),
        ],
      ),
    );
  }
}
