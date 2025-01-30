import 'package:flutter/material.dart';

import '../widgets/bottom_menu.dart';

class HeadphonesScreen extends StatelessWidget {
  const HeadphonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Müzik Ekranı"),
        backgroundColor: const Color.fromARGB(
            255, 244, 255, 196), // İsteğe bağlı: Renk seçimi
      ),
      body: Center(
        child: Text(
          "Müzik ekranım",
          style: TextStyle(
            fontSize: 24, // Yazı boyutunu büyütme
            fontWeight: FontWeight.bold, // Kalın yazı
            color: Colors.black, // Yazı rengi
          ),
        ),
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
