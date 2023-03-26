import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/components/common/form/custom-form-field.dart';
import 'package:flutter_firebase/components/common/form/index.dart';
import 'package:flutter_firebase/theme/font.dart';
import 'package:get/get.dart';
import '../helpers/auth.dart';
import 'common/form/validators.dart';

var loginForm = [
  {
    "type": FormFieldType.text,
    "name": "phoneNo",
    "placeholder": "Phone No.".tr,
    "validator": CustomValidators().phoneValidator(),
    "keyboardType": TextInputType.number
  }
];

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  verifyNumber(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      codeAutoRetrievalTimeout: (verificationId) {},
      verificationFailed: (error) {},
      verificationCompleted: (phoneAuthCredential) {},
      phoneNumber: "+91 $phoneNumber",
      codeSent: (String verificationId, int? resendToken) async {
        Get.toNamed('/otp');
        authController.updateCodeSentDetails(verificationId, resendToken);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomForm(
      fields: loginForm,
      onSubmit: (value) {
        verifyNumber(value["phoneNo"]);
      },
      submitButtonChild: Text(
        "Send OTP".tr,
        style: TextStyles.buttonText1,
      ),
    );
  }
}
