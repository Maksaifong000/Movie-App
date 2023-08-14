import 'package:flutter/cupertino.dart';

class ImageRectangle extends StatelessWidget {
  ImageRectangle({super.key, required this.urlImage,required this.width, required this.height});
  String urlImage;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/original$urlImage"))),
      width: width,
      height: height,
    );
  }
}
