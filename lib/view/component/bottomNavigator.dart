import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(Icons.business,color: Colors.white),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school,color: Colors.white),
          label: 'School',
        ),
      ],
      selectedItemColor: Colors.amber[800],
    );
  }
}
