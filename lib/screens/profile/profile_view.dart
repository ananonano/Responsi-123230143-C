import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';

// Halaman profile user
class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  // Inisialisasi controller
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            Center(
              child: Obx(
                () => Text(
                  controller.username.value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Divider(height: 40, thickness: 2),

            // Label kesan
            const Text(
              'Kesan:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),

            const Text(
              'Mas Yusuf dan Alfin adalah aslab yang mantap dan sabar selama membimbing saya dalam praktikum mobile.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            const Text(
              'Pesan:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),

            const Text(
              'Terima kasih atas segala ilmu, waktu, dan bimbingan yang telah diberikan selama ini.',
              style: TextStyle(fontSize: 16),
            ),

            const Text(
              'Kritik n saran:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),

            const Text(
              'Mantap lah mas no kritik kritik, saran juga ga usah, pokoknya mantap lah pokoknya',
              style: TextStyle(fontSize: 16),
            ),

            // Spacer untuk push button ke bawah
            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: controller.logout,
                icon: const Icon(Icons.logout),
                label: const Text('Logout', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
