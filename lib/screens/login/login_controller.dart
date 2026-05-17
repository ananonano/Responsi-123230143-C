// lib/screens/login/login_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/auth_service.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final username = usernameController.text;
    final password = passwordController.text.trim();

    if (username.isNotEmpty && password == '12345678') {
      await AuthService.saveLogin(username);

      Get.offAllNamed(Routes.main);
    } else {
      Get.snackbar(
        'Login Gagal',
        'Username tidak boleh kosong dan Password harus 12345678',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
