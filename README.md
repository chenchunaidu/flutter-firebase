# Flutter Firebase boilerplate

Flutter Firebase boilerplate is a base setup that can be used for building all new flutter with firebase applications.

## Setup

1. Goto https://console.firebase.google.com and create new project
2. Enable Authentication and Firebase database in your project and enable phone or email authentication what you are going to use in your application
3. Follow steps from this link https://firebase.google.com/docs/flutter/setup?platform=ios to setup firebase in your local

4. Run following command to configure your firebase application
   `flutterfire configure`
5. Goto project settings of your project and add your keystore sha1 and sha256 certificate.
6. Use following command to get keystore

```
 keytool -list -v \
-alias androiddebugkey -keystore ~/.android/debug.keystore
```

7. Default password for keystore will be `android`

## Folder Structure

- Components
  - common
  - all other screen components
- Helpers
  - helpers required for purpose
- Layout
  - Provides layout components like bottom navigation wrapper
- Screens
  - All screens components will lie here
- Theme
  - All theme data lies here

## Features

1. Routing
2. Authentication
3. Custom components
4. State management

### Basic Layout

Flutter boilerplate comes with basic layout which supports scaffold along with bottom navigation bar you can pass a argument to hide navigation

```dart
      getPages: getPageWrapper([
        PageWrapper(path: '/login', child: Login(), navbar: false),
        PageWrapper(path: '/home', child: const Home()),
        PageWrapper(path: '/content', child: const Content()),
        PageWrapper(path: '/calendar', child: const Calendar()),
        PageWrapper(path: '/profile', child: const Account()),
        PageWrapper(path: "/otp", child: const OTP(), navbar: false)
      ]),
```

## Components

### VStack

Wrapper around Column provides spacing property additionally

```dart
VStack(
  spacing: 8.0,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
            const Text(
              "Heading 1",
              style: TextStyles.h1,
            ),
            const Text(
              "Heading 2",
              style: TextStyles.h2,
            )])
```

### HStack

Wrapper around Row provides spacing property additionally

```dart
HStack(
  spacing: 8.0,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
            const Text(
              "Heading 1",
              style: TextStyles.h1,
            ),
            const Text(
              "Heading 2",
              style: TextStyles.h2,
            )])
```

### BorderedImage

Wrapper Image component Row provides border radius property additionally

```dart
BorderedImage(
        width: double.infinity,
        height: 400,
        fit: BoxFit.cover,
        borderRadius: 4.0,
        url:"url")
```

### CustomForm

Wrapper around the flutter form for making form handling easy. Instead of writing flutter code everytime you can define your form in List of Maps which contains all the form details like placeholder, validator, helperText CustomForm will handle everything for you.

Supports `TextInput`, `DateInput` and `Checkbox` now

```dart
List<Map<String, dynamic>> otpForm = [
  {
    "type": FormFieldType.text,
    "name": "otp",
    "placeholder": "OTP",
    "validator": ValidationBuilder(requiredMessage: "OTP is required").build(),
    "helperText": "OTP is 12345 😃",
    "autocorrect": false,
    "obscureText": true,
  }
];

class OTPForm extends StatelessWidget {
  OTPForm({Key? key}) : super(key: key);

  final login = Get.find<AuthController>().login;
  @override
  Widget build(BuildContext context) {
    return CustomForm(
      fields: otpForm,
      onSubmit: (value) {
        // handle firebase sign in
        if (value["otp"] == "12345") {
          login();
          Get.toNamed('/home');
        }
      },
      submitButtonChild: const Text(
        "Login",
        style: TextStyles.buttonText1,
      ),
    );
  }
}

```

#### Row

Sometimes you need to render multiple form fields in a row you can do that using the `type` `FormFieldType.row`

```dart
[
  {
    "type": FormFieldType.row,
    "fields": [
      {
        "type": FormFieldType.text,
        "name": "principleAmount",
        "placeholder": "Principle",
      },
      {
        "type": FormFieldType.text,
        "name": "interestRate",
        "placeholder": "Interest rate",
      },
      {
        "type": FormFieldType.checkbox,
        "name": "selected",
        "title": "Selected",
      },
    ]
  },
];

```

## Theme elements

1. Custom Colors
2. Font sizes
3. Spacing sizes / insets
4. Screen sizes

## Libraries and packages used

1. [getx](https://pub.dev/packages/get) for state management and routing
2. [form_validator](https://pub.dev/packages/form_validator) for validating the forms
3. [date_time_picker](https://pub.dev/packages/date_time_picker) for date input
