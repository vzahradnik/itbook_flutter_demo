import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final Uri imageUri;
  final String title;
  final String price;

  const BookItem({
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
            SizedBox(
                width: 250,
                height: 230,
                child: Image.network(
                    imageUri.toString(),
                    fit: BoxFit.fitWidth,
                )
            ),
            Text(title,
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 15
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