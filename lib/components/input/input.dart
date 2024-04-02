import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final String label;
  final bool isPassword;
  final int? maxLength;

  const InputTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.maxLength,
  });

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(),
          suffixIcon: !widget.isPassword ? null :
            IconButton(
              icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            )
        ),
        maxLength: widget.maxLength,
        obscureText: widget.isPassword && obscureText,
      ),
    );
  }
}
