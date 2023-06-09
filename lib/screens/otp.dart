import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/auth-info.dart';
import 'package:flutter_firebase/components/otp-form.dart';
import 'package:flutter_firebase/components/common/vstack.dart';
import 'package:flutter_firebase/theme/font.dart';
import 'package:flutter_firebase/theme/inset.dart';
import 'package:get/get.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<OTP> {
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child:
            VStack(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      VStack(
        spacing: Insets.xxl,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthInfo(
            label: "Enter OTP",
            subLabel: "OTP has been sent to your mobile number",
          ),
          OTPForm()
        ],
      )
    ]));
  }
}
