import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      radius: 25,
      child: IconButton(onPressed: () {}, icon: const Icon(Icons.search,size: 25,)),
    );
  }
}
