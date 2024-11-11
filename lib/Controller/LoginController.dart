import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Screen/WelcomeScreen.dart';
import '../Api_Services/ApiServices.dart';
import '../Model/LoginModel.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  var response = LoginModel().obs;

  TextEditingController emailCTC = TextEditingController();
  TextEditingController passCTC = TextEditingController();
  RxBool isPasswordVisible = false.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Login function
  Future<void> loginCont() async {
    try {
      isLoading(true);

      // Call the login API service
      final respo = await ApiServices().login(
        emailCTC.text,
        passCTC.text,
      );

      // Handle the response
      if (respo.responseCode == "1") {
        response.value = respo;
        Get.to(WelcomeScreen());
        print("Login successful: ${response.value.message}");
      } else {
        Get.snackbar('Login Failed', respo.message ?? "Invalid credentials",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Login error: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    // Dispose the controllers when not needed
    emailCTC.dispose();
    passCTC.dispose();
    super.onClose();
  }
}
