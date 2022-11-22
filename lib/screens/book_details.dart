import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/book_model.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book details"),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(book.title,
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25
                  ),
                  textAlign: TextAlign.center,
                ),
                if (book.subtitle.isNotEmpty)
                Padding(padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(book.subtitle,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 22
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.network(
                      book.image.toString(),
                    ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: const Text("Title"),
                        subtitle: Text(book.title),
                      ),
                      ListTile(
                        title: const Text("Subtitle"),
                        subtitle: Text(book.subtitle),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}