import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/auth-info.dart';
import 'package:flutter_firebase/components/login-form.dart';
import 'package:flutter_firebase/components/common/vstack.dart';
import 'package:flutter_firebase/components/translate/translate-buttons.dart';
import 'package:flutter_firebase/theme/inset.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
            VStack(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      VStack(
        spacing: Insets.xxl,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthInfo(
            label: "Welcome to\nFlutter boilerplate".tr,
            subLabel: "Sign in to Flutter boilerplate to check all features".tr,
          ),
          LoginForm(),
          TranslateButtons()
        ],
      )
    ]));
  }
}
