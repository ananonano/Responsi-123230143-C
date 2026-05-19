import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  static const String baseUrl = 'https://jsonfakery.com/games/paginated';

  static Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> productsJson = data['data'];
        return productsJson.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal mengambil data produk');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}
