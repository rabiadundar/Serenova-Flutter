import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 198, 216, 255),
      // AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Ana Sayfa'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.heart_circle),
            onPressed: () {},
          ),
        ],
      ),

      // Drawer (Yan Menü)
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 176, 189, 201),
        elevation: 0,
        child: Column(
          children: [
            // Drawer Header
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Colors.black87,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Kullanıcı Adı',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.search),
              title: const Text('Keşfet'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.shopping_cart),
              title: const Text('Abonelikler'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('Profilim'),
              onTap: () {
                context.go('/profile');
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Ana içerik
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text('Ana Sayfa İçeriği'),
            ),
          ),
        ],
      ),

      // Alt navigasyon çubuğu
      bottomNavigationBar: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                context.go('/home'); // Ana sayfa yönlendirmesi
              },
              icon: const Icon(
                CupertinoIcons.home, // Ana sayfa simgesi
              ),
            ),
            IconButton(
              onPressed: () {
                context.go('/calendar'); // Takvim yönlendirmesi
              },
              icon: const Icon(
                CupertinoIcons.calendar, // Takvim simgesi
              ),
            ),
            IconButton(
              onPressed: () {
                context.go('/headphones'); // Kulaklık ekranı yönlendirmesi
              },
              icon: const Icon(
                CupertinoIcons.headphones, // Kulaklık simgesi
              ),
            ),
            IconButton(
              onPressed: () {
                context.go('/profile'); // Profil yönlendirmesi
              },
              icon: const Icon(
                CupertinoIcons.person, // Profil simgesi
              ),
            ),
          ],
        ),
      ),
    );
  }
}
