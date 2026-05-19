import 'package:get/get.dart';
import '../../models/product_model.dart';
import '../../services/api_service.dart';
import '../../services/auth_service.dart';

// Controller untuk handle logic halaman home
class HomeController extends GetxController {
  // List produk yang reaktif, otomatis update UI kalau berubah
  // Cara ubah: tambah filter dengan products.where() untuk search
  var products = <ProductModel>[].obs;
  
  // Status loading yang reaktif
  // Cara ubah: ganti dengan RxBool isLoading = false.obs
  var isLoading = true.obs;
  
  // Username yang reaktif
  var username = ''.obs;

  // Lifecycle method yang dipanggil saat controller pertama kali dibuat
  // Cara ubah: tambah parameter atau listener lain
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  // Fungsi untuk load data produk dan username
  // Cara ubah: tambah parameter untuk pagination atau filter
  void loadData() async {
    // Set loading true saat mulai fetch data
    isLoading.value = true;
    
    // Ambil username dari SharedPreferences
    // Kalau null pakai 'Guest'
    username.value = await AuthService.getUsername() ?? 'Guest';
    
    try {
      // Fetch produk dari API
      // Cara ubah: tambah await Future.delayed untuk simulate loading
      products.value = await ApiService.fetchProducts();
    } catch (e) {
      // Tampilkan error kalau fetch gagal
      // Cara ubah: tambah retry button atau log error
      Get.snackbar('Error', 'Gagal memuat produk: $e');
    } finally {
      // Set loading false setelah selesai
      isLoading.value = false;
    }
  }
}
