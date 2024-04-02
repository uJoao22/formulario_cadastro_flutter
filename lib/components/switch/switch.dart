import 'package:flutter/material.dart';

class MySwitch<T> extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const MySwitch({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Colors.blue,
      title: Text(label),
      value: value,
      onChanged: onChanged,
    );
  }
}