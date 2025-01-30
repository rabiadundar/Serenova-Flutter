import 'package:flutter/material.dart';
import '../widgets/bottom_menu.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Takvim Ekranı"),
        backgroundColor: const Color.fromARGB(
            255, 244, 255, 196), // İsteğe bağlı: Renk seçimi
      ),
      body: Center(
        child: Text(
          "Takvim ekranım",
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
