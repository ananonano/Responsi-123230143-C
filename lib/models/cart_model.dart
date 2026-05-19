import 'package:hive/hive.dart';

// Import file auto-generated oleh hive_generator
// File ini dibuat dengan command: flutter packages pub run build_runner build
part 'cart_model.g.dart';

// Annotation untuk Hive, typeId harus unik untuk setiap model
// Cara ubah: ganti typeId dengan angka lain kalau bikin model baru
@HiveType(typeId: 0)
class CartModel extends HiveObject {
  // ID produk
  // HiveField(0) adalah index field di database
  // Cara ubah: jangan ubah index kalau data sudah ada, bisa corrupt
  @HiveField(0)
  final String id;

  // Nama produk
  @HiveField(1)
  final String name;

  // Rating produk
  @HiveField(2)
  final double rating;

  // URL gambar produk
  @HiveField(3)
  final String background_image;

  // Jumlah produk di cart
  // Tidak final karena bisa diubah
  @HiveField(4)
  int qty;

  // Username pemilik cart
  @HiveField(5)
  final String username;

  // Constructor untuk buat instance CartModel
  // Cara ubah: tambah field baru dengan @HiveField(6) dan parameter di constructor
  CartModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.background_image,
    required this.qty,
    required this.username,
  });
}
