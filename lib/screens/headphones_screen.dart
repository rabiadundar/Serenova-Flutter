import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_menu.dart';

class HeadphonesScreen extends StatelessWidget {
  const HeadphonesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer menüsü
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
            // Ana Sayfa
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Ana Sayfa'),
              tileColor: Colors.blue[100], // Arka plan rengi
              onTap: () => context.go("/home"),
            ),
            // Takvim
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Takvim'),
              tileColor: Colors.blue[100], // Arka plan rengi
              onTap: () => context.go("/calendar"),
            ),
            // Meditasyon
            ListTile(
              leading: Icon(Icons.headphones),
              title: Text('Meditasyon'),
              tileColor: Colors.blue[100], // Arka plan rengi
              onTap: () => context.go("/headphones"),
            ),
            // Profil
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil'),
              tileColor: Colors.blue[100], // Arka plan rengi
              onTap: () => context.go("/profile"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Meditasyon Müzikleri"),
        backgroundColor: const Color.fromARGB(255, 244, 255, 196),
      ),
      // Body kısmı
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wall.jpg'), // Arka plan görseli
            fit: BoxFit.cover, // Görselin ekrana uygun şekilde yayılması
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "🧘‍♀️ Zihnini Dinlendir",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3B4A69),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[100]
                      ?.withOpacity(0.7), // Transparan efekt ekledik
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 5)
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(Icons.music_note,
                        size: 50, color: Color(0xFF3B4A69)),
                    const SizedBox(height: 10),
                    const Text(
                      "Meditasyon Müzikleri Çalıyor...",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3B4A69),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.pause_circle_filled,
                            size: 50, color: Color(0xFF3B4A69)),
                        SizedBox(width: 20),
                        Icon(Icons.stop_circle,
                            size: 50, color: Color(0xFF3B4A69)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        color: const Color.fromARGB(
            255, 244, 255, 196), // Alt kısmın arka plan rengi
        child: const BottomMenu(),
      ),
    );
  }
}
