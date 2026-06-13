import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 65,
        width: double.infinity,
        child: Card(
          color: onPressed != null ? Colors.white24 : null,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                letterSpacing: 2,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
