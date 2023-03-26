import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/common/form/index.dart';
import 'package:flutter_firebase/theme/font.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'common/form/custom-form-field.dart';
import 'common/form/validators.dart';
import '../helpers/auth.dart';

var otpForm = [
  {
    "type": FormFieldType.text,
    "name": "otp",
    "placeholder": "OTP",
    "validator": ValidationBuilder(requiredMessage: "OTP is required").build(),
    "helperText": "OTP is 12345 😃",
    "autocorrect": false,
    "obscureText": true,
    "keyboardType": TextInputType.number
  }
];

class OTPForm extends StatelessWidget {
  OTPForm({Key? key}) : super(key: key);

  final login = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return CustomForm(
      fields: otpForm,
      onSubmit: (value) async {
        FirebaseAuth auth = FirebaseAuth.instance;
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: login.verificationId, smsCode: value["otp"]);
        await auth.signInWithCredential(credential);
      },
      submitButtonChild: const Text(
        "Login",
        style: TextStyles.buttonText1,
      ),
    );
  }
}
