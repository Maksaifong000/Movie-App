import 'package:flutter/material.dart';
import 'package:secon_p_getx/view/component/bottomNavigator.dart';
import 'package:secon_p_getx/view/trending_screen.dart';
import 'view/component/profile.dart';
import 'view/component/search_icon.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child: Row(
                children: [
                  const ProfileScreen(),
                  Expanded(child: Container()),
                  const SearchIcon(),
                ],
              ),
            ),
            TrendingScreen()
        ],
      ),
      bottomNavigationBar: const BottomNavigator(),
    );
  }
}
