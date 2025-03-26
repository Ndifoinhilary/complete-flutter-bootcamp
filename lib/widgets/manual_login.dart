import 'package:flutter/material.dart';
import 'package:login_screens/pallete.dart';

class ManualLogin extends StatelessWidget {
  final String hintText;
  const ManualLogin({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 370),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.borderColor, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.gradient2, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
