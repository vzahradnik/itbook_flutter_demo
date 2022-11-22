import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Uri imageUri;
  final String title;
  final String price;

  const BookCard({
    super.key,
    required this.imageUri,
    required this.title,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          children: [
            Expanded(
                child: Image.network(
                imageUri.toString(),
                fit: BoxFit.fitWidth,
              )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(title,
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15
                  ),
                  textAlign: TextAlign.center,
                ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Text(price,
                  style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                  )
              ),
            )
          ],
        )
    );
  }


}