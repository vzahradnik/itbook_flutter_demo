import 'package:flutter/material.dart';
import 'package:itbook_flutter_demo/widgets/book_item.dart';
import 'package:itbook_flutter_demo/widgets/it_bookstore_logo.dart';

import '../data/book_model.dart';
import '../data/http_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final HttpService _httpService = HttpService();
  late Future<List<Book>> _futureBookList;

  final _searchBoxController = TextEditingController();
  String? _searchQuery;

  @override
  void initState() {
    super.initState();
    _futureBookList = _httpService.getNewBooks();
  }

  void _clearSearchResults() {
    _searchBoxController.clear();

    setState(() {
      _searchQuery = null;
      _futureBookList = _httpService.getNewBooks();
    });
  }

  void _updateSearchResults() {
    setState(() {
      _searchQuery = _searchBoxController.text;

      if (_searchQuery != null && _searchQuery!.isNotEmpty) {
        _futureBookList = _httpService.search(_searchQuery!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const ItBookstoreLogo(height: 48),
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 15.0),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(width: 0.8)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                              width: 0.8,
                              color: Theme.of(context).primaryColor)),
                      hintText: "Search by Title, Author or ISBN",
                      prefixIcon: IconButton(
                          icon: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            _updateSearchResults();
                          }),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            _clearSearchResults();
                          })),
                  controller: _searchBoxController,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: Text(
                  _searchQuery != null && _searchQuery!.isNotEmpty
                      ? "Search results for \"$_searchQuery\""
                      : "Newly released books",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder<List<Book>>(
                  future: _futureBookList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                          child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (context, index) {
                          return BookItem(
                              imageUri: snapshot.data![index].image,
                              title: snapshot.data![index].title,
                              price: snapshot.data![index].price);
                        },
                        itemCount: snapshot.data!.length,
                      ));
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return Container(
                        margin: const EdgeInsets.all(16),
                        child: const Center(child: CircularProgressIndicator()),
                      );
                    }
                  }),
            ],
          ),
        ));
  }
}
