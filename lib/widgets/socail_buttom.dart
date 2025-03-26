import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_screens/pallete.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final String text;
  final double horizontal;
  const SocialButton({
    super.key,
    required this.icon,
    required this.text,
    this.horizontal = 100,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(
        icon,
        width: 40,
        colorFilter: ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn),
      ),
      label: Text(
        text,
        style: TextStyle(color: Pallete.whiteColor, fontSize: 14),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: horizontal),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Pallete.borderColor, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
