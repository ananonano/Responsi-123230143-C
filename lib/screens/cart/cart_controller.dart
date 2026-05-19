import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/cart_model.dart';
import '../../services/hive_service.dart';
import '../../services/auth_service.dart';

class CartController extends GetxController {
  var cartItems = <CartModel>[].obs;
  var totalQuantity = 0.obs;
  var cartKeys = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCart();
  }

  void loadCart() async {
    String currentUser = await AuthService.getUsername() ?? '';
    cartItems.value = HiveService.getCartByUsername(currentUser);
    cartKeys.value = HiveService.getCartKeysByUsername(currentUser);
    calculateTotal();
  }

  void calculateTotal() {
    int total = 0;
    for (var item in cartItems) {
      total += item.qty;
    }
    totalQuantity.value = total;
  }

  void incrementQty(int index) async {
    int hiveKey = cartKeys[index];
    cartItems[index].qty++;
    await HiveService.updateCartItem(hiveKey, cartItems[index]);
    loadCart();
  }

  void decrementQty(int index) async {
    if (cartItems[index].qty > 1) {
      int hiveKey = cartKeys[index];
      cartItems[index].qty--;
      await HiveService.updateCartItem(hiveKey, cartItems[index]);
      loadCart();
    }
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
        int hiveKey = cartKeys[index];
        await HiveService.deleteCartItem(hiveKey);
        Get.back();
        loadCart();
        Get.snackbar('Berhasil', 'Item dihapus dari keranjang');
      },
    );
  }
}
