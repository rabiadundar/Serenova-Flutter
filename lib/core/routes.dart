//import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/calendar_screen.dart';
import '../screens/headphones_screen.dart';

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/', // Başlangıç rotası
  routes: [
    // LoadingScreen (Yükleniyor Ekranı)
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),

    // HomeScreen (Ana Sayfa Ekranı)
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),

    // CalendarScreen (Takvim Ekranı)
    GoRoute(
      path: '/calendar',
      builder: (context, state) => const CalendarScreen(),
    ),

    // ProfileScreen (Profil Ekranı)
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/headphones',
      builder: (context, state) => const HeadphonesScreen(),
    ),
  ],
);
