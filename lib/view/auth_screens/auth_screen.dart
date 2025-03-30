import 'package:amazon_clone/constants/common_functions.dart';
import 'package:amazon_clone/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  String currentCountryCode = "+91";
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: Image.asset(
          'assets/images/amazon_logo.png',
          height: height * 0.04,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,

          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              CommonFunctions.blankSpace(height * 0.02, 0),
              Container(
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(color: greyShade3),
                ),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.06,
                      width: width,
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: greyShade3)),
                        color: greyShade2,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Row(
                        children: [
                          // designing a check box
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLogin = true;
                              });
                            },
                            child: Container(
                              height: height * 0.05,
                              width: width * 0.05,
                              // color: white,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: grey),
                                // color: greyShade1,
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.circle,
                                size: height * 0.01,
                                color: !isLogin ? transparent : secondaryColor,
                              ),
                            ),
                          ),
                          // end of check box
                          CommonFunctions.blankSpace(0, width * 0.02),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Create Account",
                                  style: textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "  New To Amazon?",
                                  style: textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.01,
                      ),
                      // color: red,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isLogin = false;
                                  });
                                },
                                child: Container(
                                  height: height * 0.05,
                                  width: width * 0.05,
                                  // color: white,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: grey),
                                    // color: greyShade1,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.circle,
                                    size: height * 0.01,
                                    color:
                                        isLogin ? transparent : secondaryColor,
                                  ),
                                ),
                              ),
                              // end of check box
                              CommonFunctions.blankSpace(0, width * 0.02),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Sign In.",
                                      style: textTheme.bodyLarge!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Already a Customer?",
                                      style: textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          CommonFunctions.blankSpace(height * 0.01, 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    onSelect: (value) {
                                      setState(() {
                                        currentCountryCode =
                                            '+${value.phoneCode}';
                                      });
                                    },
                                  );
                                },
                                child: Container(
                                  height: height * 0.06,
                                  width: width * 0.2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: grey),
                                    borderRadius: BorderRadius.circular(5),
                                    color: greyShade1,
                                  ),
                                  child: Text(
                                    currentCountryCode,
                                    style: textTheme.displaySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.06,
                                width: width * 0.64,
                                child: TextFormField(
                                  controller: phoneNumberController,
                                  keyboardType: TextInputType.phone,
                                  cursorColor: black,
                                  style: textTheme.displaySmall,
                                  decoration: InputDecoration(
                                    hintText: "Phone number",
                                    hintStyle: textTheme.bodySmall,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(color: grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: secondaryColor,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(color: grey),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(color: grey),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CommonFunctions.blankSpace(height * 0.02, 0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              minimumSize: Size(width, height * 0.06),
                            ),
                            child: Text(
                              "Continue",
                              style: textTheme.displayMedium,
                            ),
                          ),
                          CommonFunctions.blankSpace(height * 0.01, 0),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "By continuing, you agree to Amazon's ",
                                  style: textTheme.labelMedium,
                                ),
                                TextSpan(
                                  text: "Conditions of Use",
                                  style: textTheme.labelMedium!.copyWith(
                                    color: blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: " and ",
                                  style: textTheme.labelMedium,
                                ),
                                TextSpan(
                                  text: "Privacy Notice",
                                  style: textTheme.labelMedium!.copyWith(
                                    color: blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CommonFunctions.blankSpace(height * 0.05, 0),
              // footer section
              Column(
                children: [
                  Container(
                    height: 2,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [white, grey, white]),
                      color: red,
                    ),
                  ),
                  CommonFunctions.blankSpace(height * 0.01, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Conditions of Use",
                        style: textTheme.bodyMedium!.copyWith(color: blue),
                      ),
                      CommonFunctions.blankSpace(0, width * 0.05),
                      Text(
                        "Privacy Notice",
                        style: textTheme.bodyMedium!.copyWith(color: blue),
                      ),
                      CommonFunctions.blankSpace(0, width * 0.05),
                      Text(
                        "Help",
                        style: textTheme.bodyMedium!.copyWith(color: blue),
                      ),
                    ],
                  ),
                  CommonFunctions.blankSpace(height * 0.01, 0),
                  Center(
                    child: Text(
                      "© 1996-2023, Amazon.com, Inc. or its affiliates",
                      style: textTheme.labelMedium!.copyWith(color: grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
