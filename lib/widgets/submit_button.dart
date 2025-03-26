import 'package:flutter/material.dart';
import 'package:login_screens/pallete.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Pallete.gradient1, Pallete.gradient2, Pallete.gradient3],
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.all(10),
          fixedSize: Size(375, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        child: Text(
          "Sign in",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
    );
  }
}
