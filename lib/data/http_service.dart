import 'dart:convert';

import 'package:http/http.dart';
import 'package:itbook_flutter_demo/data/book_model.dart';

/// Implementation of a public API service for IT Bookstore.
/// Reference documentation available at <link>https://api.itbook.store/</link>.
class HttpService {
  Client client = Client();
  final String _newBooksUrl = "https://api.itbook.store/1.0/new";
  final String _searchUrl = "https://api.itbook.store/1.0/search";
  final String _detailsUrl = "https://api.itbook.store/1.0/books";

  // Get newly released books.
  Future<List<Book>> getNewBooks() async {
    final Response res = await client.get(Uri.parse(_newBooksUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body)['books'];

      List<Book> books = body
          .map(
            (dynamic item) => Book.fromJson(item),
      )
          .toList();

      return books;
    } else {
      throw Exception("Unable to retrieve newest books.");
    }
  }

  // Search books by title, author, ISBN or keywords.
  // /search/{query}
  // /search/{query}/{page}
  Future<List<Book>> search(String query) async {
    final Response res = await client.get(Uri.parse("$_searchUrl/$query"));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body)['books'];

      List<Book> books = body
          .map(
            (dynamic item) => Book.fromJson(item),
      )
          .toList();

      return books;
    } else {
      throw Exception("Search query \"$query\" has failed.");
    }
  }

  // Get book details by ISBN.
  Future<Book> getBook(String isbn) async {
    final Response res = await client.get(Uri.parse("$_detailsUrl/$isbn"));

    if (res.statusCode == 200) {
      Book book = Book.fromJson(jsonDecode(res.body));
      return book;
    } else {
      throw Exception("Unable to get details for book with ISBN \"$isbn\".");
    }
  }
}