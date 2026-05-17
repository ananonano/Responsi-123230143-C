import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String thumbnail;

  @HiveField(4)
  int qty;

  @HiveField(5)
  final String username;

  CartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.qty,
    required this.username,
  });
}
