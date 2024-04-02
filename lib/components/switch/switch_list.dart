import 'package:flutter/material.dart';
import 'switch.dart';

class ListSwitch<T> extends StatelessWidget {
  final String title;
  final bool value1;
  final bool value2;
  final String label1;
  final String label2;
  final ValueChanged<bool> onChanged1;
  final ValueChanged<bool> onChanged2;

  const ListSwitch({
    super.key,
    required this.title,
    required this.value1,
    required this.value2,
    required this.label1,
    required this.label2,
    required this.onChanged1,
    required this.onChanged2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        MySwitch(label: label1, value: value1, onChanged: onChanged1),
        MySwitch(label: label2, value: value2, onChanged: onChanged2),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
