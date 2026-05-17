// lib/screens/home/home_controller.dart

import 'package:get/get.dart';
import '../../models/product_model.dart';
import '../../services/api_service.dart';
import '../../services/auth_service.dart';

class HomeController extends GetxController {
  // Variabel reaktif
  var products = <ProductModel>[].obs;
  var isLoading = true.obs;
  var username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    isLoading.value = true;
    username.value = await AuthService.getUsername() ?? 'Guest';
    
    try {
      products.value = await ApiService.fetchProducts();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat produk: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
