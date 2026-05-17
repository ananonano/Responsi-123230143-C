import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/cart_model.dart';
import '../../services/hive_service.dart';
import '../../services/auth_service.dart';

class CartController extends GetxController {
  var cartItems = <CartModel>[].obs;
  var totalPrice = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  void loadCart() async {
    String currentUser = await AuthService.getUsername() ?? '';
    cartItems.value = HiveService.getCartByUsername(currentUser);
    calculateTotal();
  }

  void calculateTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price * item.qty;
    }
    totalPrice.value = total;
  }

  void deleteItem(int index) {
    Get.defaultDialog(
      title: "Hapus Item",
      middleText: "Yakin ingin menghapus item ini dari keranjang?",
      textConfirm: "Ya, Hapus",
      textCancel: "Batal",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () async {
        String currentUser = await AuthService.getUsername() ?? '';

        List<dynamic> keys = HiveService.getCartKeysByUsername(currentUser);
        int hiveKey = keys[index];

        await HiveService.deleteCartItem(hiveKey);

        Get.back();
        loadCart();
        Get.snackbar('Berhasil', 'Item dihapus dari keranjang');
      },
    );
  }
}
