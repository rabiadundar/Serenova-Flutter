import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_menu.dart';

class HeadphonesScreen extends StatelessWidget {
  const HeadphonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 244, 255, 196),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Merhaba Rabia!",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3B4A69),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Ana Sayfa'),
              onTap: () => context.go("/home"),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Takvim'),
              onTap: () => context.go("/calendar"),
            ),
            ListTile(
              leading: Icon(Icons.headphones),
              title: Text('Meditasyon'),
              onTap: () => context.go("/headphones"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              onTap: () => context.go("/profile"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Müzik Ekranı"),
        backgroundColor: const Color.fromARGB(255, 244, 255, 196),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                SizedBox(width: 10),
                Text(
                  "Meditasyona Hoş Geldin!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3B4A69),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                "🎧 Müzik ekranım",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B4A69),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
