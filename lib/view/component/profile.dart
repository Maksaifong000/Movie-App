import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 25,
      child: IconButton(
        icon: const Icon(Icons.broken_image_rounded, size: 25, color: Colors.black),
        onPressed: () {},
      ),
    );
  }
}
