import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/auth_service.dart';
import '../../routes/app_routes.dart';

// Controller untuk handle logic halaman login
class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var isPasswordVisible = false.obs;
  var errorMessage = ''.obs;

  void login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      errorMessage.value = 'Username dan password tidak boleh kosong';
      return;
    }

    if (username.length < 5) {
      errorMessage.value = 'Username minimal 5 karakter';
      return;
    }

    if (password != '143') {
      errorMessage.value = 'Password harus 3 digit terakhir NIM';
      return;
    }

    await AuthService.saveLogin(username);
    Get.offAllNamed(Routes.main);
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
