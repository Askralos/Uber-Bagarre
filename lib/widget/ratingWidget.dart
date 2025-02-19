import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(rating as String),
        const Icon(Icons.star_border, color: Colors.yellow),
      ],
    );
  }
}
