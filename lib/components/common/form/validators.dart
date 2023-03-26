import 'package:form_validator/form_validator.dart';

class CustomValidators {
  var phoneValidator =
      ValidationBuilder(requiredMessage: "Phone number is required")
          .phone("Please enter correct phone number")
          .maxLength(10)
          .build;
}
