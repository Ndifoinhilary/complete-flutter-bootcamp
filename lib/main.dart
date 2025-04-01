import 'package:amazon_clone/utils/theme.dart';
// import 'package:amazon_clone/view/auth_screens/auth_screen.dart';
import 'package:amazon_clone/view/auth_screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: OTPScreen(mobileNumber: "+237653152881"),
      ),
    );
  }
}
