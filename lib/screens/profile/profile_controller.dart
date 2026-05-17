import 'package:get/get.dart';
import '../../services/auth_service.dart';
import '../../routes/app_routes.dart';

class ProfileController extends GetxController {
  var username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() async {
    username.value = await AuthService.getUsername() ?? 'Guest';
  }

  void logout() async {
    await AuthService.logout();

    Get.offAllNamed(Routes.login);
  }
}
