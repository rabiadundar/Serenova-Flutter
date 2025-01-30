import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_menu.dart'; // `BottomMenu` widget'ını burada kullanıyoruz

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkMode = false; // Başlangıçta tema Light olacak

  @override
  Widget build(BuildContext context) {
    // Tema uyumu sağlamak için app bar, body, drawer ve genel tema renklerini kullanalım
    final Color appBarColor = _isDarkMode
        ? const Color.fromARGB(255, 28, 33, 53) // Koyu tema AppBar rengi
        : const Color.fromARGB(255, 244, 255, 196); // Açık tema AppBar rengi

    final Color bodyColor =
        _isDarkMode ? const Color(0xFF24215A) : Colors.white;

    final Color drawerBackgroundColor =
        _isDarkMode ? const Color(0xFF1E1E1E) : Colors.grey[200]!;

    final Color textColor = _isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: bodyColor, // Genel arka plan rengi
      appBar: AppBar(
        backgroundColor: appBarColor, // AppBar rengi
        title: Text('Ana Sayfa', style: TextStyle(color: textColor)),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.heart_circle),
            color: textColor, // İkon rengi
            onPressed: () {},
          ),
          Switch(
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
              });
              // Tema değiştiğinde uygulama temasını değiştirebilirsiniz
              // App bar ve body renkleri yukarıda otomatik değişiyor.
            },
            activeColor:
                Colors.blue, // Switch'in aktif rengini ayarlayabilirsiniz
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: drawerBackgroundColor, // Drawer'ın arka plan rengi
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
                    color: textColor, // Kullanıcı simgesinin rengi
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Kullanıcı Adı',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            // Menü öğeleri
            ListTile(
              leading: Icon(CupertinoIcons.home, color: textColor),
              title: Text('Ana Sayfa', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.search, color: textColor),
              title: Text('Keşfet', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.shopping_cart, color: textColor),
              title: Text('Abonelikler', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.person, color: textColor),
              title: Text('Profilim', style: TextStyle(color: textColor)),
              onTap: () {
                context.go('/profile');
              },
            ),
            ListTile(
              leading: Icon(CupertinoIcons.settings, color: textColor),
              title: Text('Ayarlar', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Ana Sayfa İçeriği',
                style: TextStyle(
                  fontFamily: 'Akaya',
                  color: textColor, // Yazı rengini tema ile uyumlu yapalım
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomMenu(), // Alt navigasyon çubuğu
    );
  }
}
