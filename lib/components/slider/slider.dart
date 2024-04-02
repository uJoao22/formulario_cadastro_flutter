import 'package:flutter/material.dart';

class SliderDouble<T> extends StatelessWidget {
  final String title;
  final double value;
  final double min;
  final double max;
  final int divisions;
  final ValueChanged<double> onChanged;


  const SliderDouble({
    super.key,
    required this.title,
    required this.value,
    required this.min,
    required this.max,
    required this.divisions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        Expanded(
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            label: value.toString(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}