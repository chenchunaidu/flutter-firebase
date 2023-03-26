import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

const publicRoutes = ["/login", "sign-up", "/", "/otp", "/translate"];

class AuthController extends GetxController {
  late User user;
  late String verificationId;
  late int? resendToken;
  var isAuthenticated = false.obs;
  login(User newUser) {
    user = newUser;
    isAuthenticated.value = true;
    Get.toNamed("/home");
  }

  logout() {
    isAuthenticated.value = false;
  }

  updateCodeSentDetails(String _verificationId, int? _resendToken) {
    verificationId = _verificationId;
    resendToken = _resendToken;
  }
}

void routingCallback(Routing? routing) {
  var isAuthenticated = Get.find<AuthController>().isAuthenticated;
  if (!publicRoutes.contains(routing?.current) && !isAuthenticated.value) {
    Get.until((route) => false);
  }
}
