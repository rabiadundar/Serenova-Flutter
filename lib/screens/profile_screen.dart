import 'package:flutter/material.dart';

import '../widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("Profil", style: Theme.of(context).textTheme.titleMedium),
          Text("Profil", style: Theme.of(context).textTheme.titleMedium),
          Text("Profil", style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}
