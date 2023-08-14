import 'package:flutter/material.dart';

class LoadingImage extends StatelessWidget {
  const LoadingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black38,
          borderRadius: BorderRadius.all(Radius.circular(10)),),
      width: 140,
      height: 180,
    );
  }
}
