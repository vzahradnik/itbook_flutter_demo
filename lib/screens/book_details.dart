import 'package:flutter/material.dart';

import '../data/book_model.dart';
import '../data/http_service.dart';
import '../widgets/star_display.dart';

class BookDetails extends StatefulWidget {
  final String isbn;

  const BookDetails({super.key, required this.isbn});

  @override
  State<StatefulWidget> createState() {
    return _BookDetailsState();
  }
}

class _BookDetailsState extends State<BookDetails> {
  final HttpService _httpService = HttpService();
  late Future<Book> _futureBook;

  @override
  void initState() {
    super.initState();
    _futureBook = _httpService.getBook(widget.isbn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Book details"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<Book>(
              future: _futureBook,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      Text(
                        snapshot.data!.title,
                        style: const TextStyle(
                            color: Colors.blueGrey, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                      if (snapshot.data!.subtitle.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            snapshot.data!.subtitle,
                            style: const TextStyle(
                                color: Colors.red, fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Image.network(
                          snapshot.data!.image.toString(),
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
                              DataCell(Text(snapshot.data!.price,
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold))),
                            ]),
                        DataRow(cells: [
                          const DataCell(Text("Rating")),
                          DataCell(
                            IconTheme(
                              data: const IconThemeData(
                                color: Colors.red,
                                size: 22,
                              ),
                              child: StarDisplay(
                                  value: snapshot.data!.rating ?? 0),
                            ),
                          ),
                        ]),
                        DataRow(
                            color: MaterialStatePropertyAll(
                                Colors.grey.withOpacity(0.1)),
                            cells: [
                              const DataCell(Text("Author")),
                              DataCell(Text(snapshot.data!.authors!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold))),
                            ]),
                        DataRow(cells: [
                          const DataCell(Text("Publisher")),
                          DataCell(Text(snapshot.data!.publisher!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold))),
                        ]),
                        DataRow(
                            color: MaterialStatePropertyAll(
                                Colors.grey.withOpacity(0.1)),
                            cells: [
                              const DataCell(Text("Published")),
                              DataCell(Text(snapshot.data!.year!.toString(),
                                  style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold))),
                            ]),
                        DataRow(cells: [
                          const DataCell(Text("Pages")),
                          DataCell(Text(snapshot.data!.pages!.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold))),
                        ]),
                        DataRow(
                            color: MaterialStatePropertyAll(
                                Colors.grey.withOpacity(0.1)),
                            cells: [
                              const DataCell(Text("Language")),
                              DataCell(Text(snapshot.data!.language!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold))),
                            ]),
                        DataRow(cells: [
                          const DataCell(Text("ISBN-10")),
                          DataCell(Text(snapshot.data!.isbn10!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold))),
                        ]),
                        DataRow(
                            color: MaterialStatePropertyAll(
                                Colors.grey.withOpacity(0.1)),
                            cells: [
                              const DataCell(Text("ISBN-13")),
                              DataCell(Text(snapshot.data!.isbn13,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold))),
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Text(
                          snapshot.data!.description!,
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return Container(
                  margin: const EdgeInsets.all(16),
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ),
        ));
  }
}
