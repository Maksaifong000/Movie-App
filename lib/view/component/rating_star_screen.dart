import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStarScreen extends StatelessWidget {
  RatingStarScreen({super.key,required this.rateVote});
  var rateVote;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rateVote/2,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize:15.0,
      direction: Axis.horizontal,
    );
  }
}
