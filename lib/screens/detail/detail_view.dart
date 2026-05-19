import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_controller.dart';

class DetailView extends StatelessWidget {
  DetailView({super.key});

  final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    final p = controller.product;

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                p.background_image,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image, size: 200),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              p.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('ID: ${p.id}'),
            const SizedBox(height: 4),
            Text('Released: ${p.released}'),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 20),
                Text(' ${p.rating}'),
              ],
            ),
            const SizedBox(height: 4),
            Text('Ratings Count: ${p.ratings_count}'),
            const SizedBox(height: 4),
            Text('Reviews Count: ${p.reviews_count}'),
            const SizedBox(height: 4),
            Text('Updated At: ${p.updated_at}'),
            const Divider(height: 30),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: controller.decrement,
                    ),
                    Obx(
                      () => Text(
                        '${controller.qty.value}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: controller.increment,
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: controller.addToCart,
                  icon: const Icon(Icons.shopping_cart_checkout),
                  label: const Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
