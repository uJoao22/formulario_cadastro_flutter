import 'package:flutter/material.dart';
import 'radio.dart';

class ListRadio<T> extends StatelessWidget {
  final String title;
  final String? value;
  final ValueChanged<String?> onChanged;

  const ListRadio({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        MyRadio<String>(title: "Masculino", value: "M", groupValue: value, onChanged: onChanged),
        MyRadio<String>(title: "Feminino", value: "F", groupValue: value, onChanged: onChanged),
        const SizedBox(height: 20.0),
      ],
    );
  }
}