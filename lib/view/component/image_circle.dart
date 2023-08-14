import 'package:flutter/cupertino.dart';

class ImageCircle extends StatelessWidget {
  ImageCircle({super.key,required this.width,required this.height, required this.urlImage});

  var width;
  var height;
  var urlImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(200)),
          image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/original$urlImage"))),
      width: width,
      height: height,
    );
  }
}
