import 'package:flutter/material.dart';
import 'core/router.dart'; // Burada app_router.dart dosyanızı içeri aktarıyoruz

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter widget'larını başlat
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: router, // go_router yapılandırmamızı burada kullanıyoruz
      debugShowCheckedModeBanner: false, // Debug bandını kaldır
    );
  }
}
