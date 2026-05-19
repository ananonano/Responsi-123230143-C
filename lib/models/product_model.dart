// Model untuk data produk dari API
class ProductModel {
  // ID unik produk
  final String id;
  
  // Nama produk
  final String name;
  
  // Deskripsi produk
  final String released;
  
  // Kategori produk
  final String background_image;
  
  // Harga produk
  final double rating;
  
  // Rating produk
  final int ratings_count;

  final int reviews_count;
  
  // Stok produk
  final String updated_at;

  // Constructor untuk buat instance ProductModel
  // Cara ubah: tambah field baru sesuai response API
  ProductModel({
    required this.id,
    required this.name,
    required this.released,
    required this.background_image,
    required this.rating,
    required this.ratings_count,
    required this.reviews_count,
    required this.updated_at,
  });

  // Factory method untuk convert JSON ke ProductModel
  // Cara ubah: sesuaikan key json['key'] dengan struktur API
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      // Ambil id dari JSON, kalau null pakai ''
      id: json['id']?.toString() ?? '',
      
      // Ambil name dari JSON, kalau null pakai 'No Name'
      name: json['name'] ?? 'No Name',
      
      // Ambil released dari JSON, kalau null pakai 'No Release Date'
      released: json['released'] ?? 'No Release Date',
      
      // Ambil background_image dari JSON, kalau null pakai 'No Image'
      background_image: json['background_image'] ?? 'No Image',
      
      // // Ambil category dari JSON
      // category: json['category'] ?? '',
      
      // // Convert price ke double, kalau null pakai 0
      // price: (json['price'] ?? 0).toDouble(),
      
      // Convert rating ke double
      rating: (json['rating'] ?? 0).toDouble(),
      
      // Ambil stock dari JSON
      ratings_count: json['ratings_count'] ?? 0,
      
      // Ambil brand dari JSON
      reviews_count: json['reviews_count'] ?? 0,
      
      // Ambil thumbnail dari JSON
      updated_at: json['updated_at'] ?? '',
    );
  }
}
