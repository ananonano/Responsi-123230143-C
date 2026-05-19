import 'package:get/get.dart';
import '../../models/product_model.dart';
import '../../models/cart_model.dart';
import '../../services/hive_service.dart';
import '../../services/auth_service.dart';

class DetailController extends GetxController {
  late ProductModel product;
  var qty = 1.obs;

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as ProductModel;
  }

  void increment() {
    qty.value++;
  }

  void decrement() {
    if (qty.value > 1) {
      qty.value--;
    }
  }

  void addToCart() async {
    String currentUser = await AuthService.getUsername() ?? '';
    final cartItem = CartModel(
      id: product.id,
      name: product.name,
      rating: product.rating,
      background_image: product.background_image,
      qty: qty.value,
      username: currentUser,
    );
    await HiveService.addToCart(cartItem);
    Get.back();
    Get.snackbar('Sukses', '${qty.value} ${product.name} masuk ke keranjang!');
  }
}
