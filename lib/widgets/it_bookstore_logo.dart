import 'package:flutter/material.dart';

class ItBookstoreLogo extends StatelessWidget {
  const ItBookstoreLogo({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/it_bookstore_logo.png', fit: BoxFit.cover, height: height),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: const Text(
              "Book.store",
              style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold
              )),
        )
      ],
    );
  }

}