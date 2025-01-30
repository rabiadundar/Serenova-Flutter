import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              context.go("/home"); // Ana sayfa yönlendirmesi
            },
            icon: const Icon(
              CupertinoIcons.home, // Ana sayfa simgesi
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/calendar"); // Takvim yönlendirmesi
            },
            icon: const Icon(
              CupertinoIcons.calendar, // Takvim simgesi
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/headphones"); // Kulaklık ekranı yönlendirmesi
            },
            icon: const Icon(
              CupertinoIcons.headphones, // Kulaklık simgesi
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/profile"); // Profil yönlendirmesi
            },
            icon: const Icon(
              CupertinoIcons.person, // Profil simgesi
            ),
          ),
        ],
      ),
    );
  }
}
