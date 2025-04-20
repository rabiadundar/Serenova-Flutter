import 'package:flutter/material.dart';

class YogaPoseCard extends StatelessWidget {
  final int index;

  const YogaPoseCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/yoga_pose_$index.jpg', // Yoga pozları görselleri
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            "Poz ${index + 1}", // Poz ismi
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
