// Credit to:
// https://medium.com/icnh/a-star-rating-widget-for-flutter-41560f82c8cb
import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  final int value;

  const StarDisplay({super.key, this.value = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}
