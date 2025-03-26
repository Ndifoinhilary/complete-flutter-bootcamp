import 'package:flutter/material.dart';
import 'package:login_screens/widgets/manual_login.dart';
import 'package:login_screens/widgets/socail_buttom.dart';
import 'package:login_screens/widgets/submit_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(14),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              Text(
                "Sign in",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              SizedBox(height: 20),
              SocialButton(
                icon: "assets/svgs/f_logo.svg",
                text: "Continue with Facebook",
                horizontal: 90,
              ),
              SizedBox(height: 20),
              SocialButton(
                icon: "assets/svgs/g_logo.svg",
                text: "Continue with Google",
              ),
              SizedBox(height: 20),
              Text(
                "or",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              SizedBox(height: 15),
              ManualLogin(hintText: "Email"),
              SizedBox(height: 15),
              ManualLogin(hintText: "Password"),
              SizedBox(height: 20),
              SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
