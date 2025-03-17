import 'package:flutter/material.dart';

class AdditionalInfoWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInfoWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30),
        SizedBox(height: 10),
        Text(label),
        SizedBox(height: 15),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: "italic",
          ),
        ),
      ],
    );
  }
}
