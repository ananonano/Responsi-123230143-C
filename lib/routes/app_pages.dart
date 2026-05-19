import 'package:get/get.dart';
import 'package:responsi/screens/cart/cart_view.dart';
import 'package:responsi/screens/detail/detail_view.dart';
import 'package:responsi/screens/login/login_view.dart';
import 'package:responsi/screens/main/main_view.dart';
import 'app_routes.dart';

// Class untuk mapping route dengan halaman
class AppPages {
  // List semua halaman yang bisa diakses di aplikasi
  // Cara ubah: tambah GetPage baru untuk route baru
  static final pages = [
    // Route login menuju LoginView
    // Cara ubah: tambah binding dengan binding: LoginBinding()
    GetPage(name: Routes.login, page: () => LoginView()),
    
    // Route main menuju MainView
    GetPage(name: Routes.main, page: () => MainView()),
    
    // Route detail menuju DetailView
    // Biasanya nerima parameter produk lewat Get.arguments
    GetPage(name: Routes.detail, page: () => DetailView()),
    
    // Route cart menuju CartView
    GetPage(
      name: Routes.cart,
      page: () => CartView(),
    ),
  ];
}
