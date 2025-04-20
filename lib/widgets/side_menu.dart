import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 244, 255, 196), // Açık sarı-yeşil
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            // Üst kısım: Kullanıcı bilgileri
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 228, 250, 180),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Rabia",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "rabia@example.com",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Menü öğeleri
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text("Ana Sayfa",
                  style: TextStyle(color: Colors.black)),
              onTap: () {
                context.go('/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today, color: Colors.black),
              title:
                  const Text("Takvim", style: TextStyle(color: Colors.black)),
              onTap: () {
                context.go('/calendar');
              },
            ),
            ListTile(
              leading: const Icon(Icons.headphones, color: Colors.black),
              title: const Text("Müzik", style: TextStyle(color: Colors.black)),
              onTap: () {
                context.go('/headphones');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title:
                  const Text("Profil", style: TextStyle(color: Colors.black)),
              onTap: () {
                context.go('/profile');
              },
            ),

            const Spacer(),
            const Divider(),

            // Çıkış
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: const Text("Çıkış Yap",
                  style: TextStyle(color: Colors.black)),
              onTap: () {
                // Çıkış işlemi
              },
            ),
          ],
        ),
      ),
    );
  }
}
