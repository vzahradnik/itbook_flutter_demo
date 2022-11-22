import 'dart:convert';

import 'package:flutter/material.dart';

import '../data/book_model.dart';
import '../widgets/star_display.dart';

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
                Text(
                  book.title,
                  style: const TextStyle(color: Colors.blueGrey, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                if (book.subtitle.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      book.subtitle,
                      style: const TextStyle(color: Colors.red, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.network(
                    book.image.toString(),
                  ),
                ),
                DataTable(headingRowHeight: 0, columns: [
                  DataColumn(label: Container()),
                  DataColumn(label: Container()),
                ], rows: [
                  DataRow(
                      color: MaterialStatePropertyAll(
                          Colors.grey.withOpacity(0.1)),
                      cells: [
                        const DataCell(Text("Price")),
                        DataCell(Text(book.price,
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold))),
                      ]),
                  const DataRow(cells: [
                    DataCell(Text("Rating")),
                    DataCell(
                      IconTheme(
                        data: IconThemeData(
                          color: Colors.red,
                          size: 22,
                        ),
                        child: StarDisplay(value: 0),
                      ),
                    ),
                  ]),
                  DataRow(
                      color: MaterialStatePropertyAll(
                          Colors.grey.withOpacity(0.1)),
                      cells: const [
                        DataCell(Text("Author")),
                        DataCell(Text("John Doe",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                      ]),
                  const DataRow(cells: [
                    DataCell(Text("Publisher")),
                    DataCell(Text("Martinus",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                  DataRow(
                      color: MaterialStatePropertyAll(
                          Colors.grey.withOpacity(0.1)),
                      cells: const [
                        DataCell(Text("Published")),
                        DataCell(Text("5",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold))),
                      ]),
                  const DataRow(cells: [
                    DataCell(Text("Pages")),
                    DataCell(Text("300",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                  DataRow(
                      color: MaterialStatePropertyAll(
                          Colors.grey.withOpacity(0.1)),
                      cells: const [
                        DataCell(Text("Language")),
                        DataCell(Text("English",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                      ]),
                  const DataRow(cells: [
                    DataCell(Text("Format")),
                    DataCell(Text("Paper book",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                  ]),
                  DataRow(
                      color: MaterialStatePropertyAll(
                          Colors.grey.withOpacity(0.1)),
                      cells: const [
                        DataCell(Text("ISBN-10")),
                        DataCell(Text("45646465",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                      ]),
                  const DataRow(cells: [
                    DataCell(Text("ISBN-13")),
                    DataCell(Text("5465446546",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                  ])
                ]),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Text(
                    "Description",
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
