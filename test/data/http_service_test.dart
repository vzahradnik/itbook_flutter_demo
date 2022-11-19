import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:itbook_flutter_demo/data/book_model.dart';
import 'package:itbook_flutter_demo/data/http_service.dart';

void main() {
  test("Service correctly returns newly added books.", () async {
    final httpService = HttpService();
    httpService.client = MockClient((request) async {
      String jsonPayload = await File("./test/data/fixtures/new_books.json").readAsString();
      return Response(jsonPayload, 200);
    });

    List<Book> books = await httpService.getNewBooks();
    expect(books.length, 20);
    expect(books[0].title, "Game Hacking Academy");
  });

  test("Service fails to retrieve newly added books.", () async {
    final httpService = HttpService();
    httpService.client = MockClient((request) async {
      String json = "{}";
      return Response(json, 404);
    });

    expect(httpService.getNewBooks(), throwsException);
  });

  test("Service correctly runs search query with some results.", () async {
    final httpService = HttpService();
    httpService.client = MockClient((request) async {
      String jsonPayload = await File("./test/data/fixtures/search_results.json").readAsString();
      return Response(jsonPayload, 200);
    });

    List<Book> books = await httpService.search("flutter");
    expect(books.length, 8);
    expect(books[0].title, "Building Games with Flutter");
  });

  test("Service correctly runs search query with zero results.", () async {
    final httpService = HttpService();
    httpService.client = MockClient((request) async {
      String jsonPayload = await File("./test/data/fixtures/empty_search_results.json").readAsString();
      return Response(jsonPayload, 200);
    });

    List<Book> books = await httpService.search("xyz");
    expect(books.length, 0);
  });

  test("Service fails to run search query.", () async {
    final httpService = HttpService();
    httpService.client = MockClient((request) async {
      String json = "{}";
      return Response(json, 404);
    });

    expect(httpService.search("flutter"), throwsException);
  });

  test("Service correctly return book details.", () async {
    final httpService = HttpService();
    httpService.client = MockClient((request) async {
      String jsonPayload = await File("./test/data/fixtures/book_details.json").readAsString();
      return Response(jsonPayload, 200);
    });
    Book book = await httpService.getBook("9781617294136");
    expect(book.title, "Securing DevOps");
  });

  test("Service throws an error when invalid ISBN is given.", () async {
    final httpService = HttpService();
    httpService.client = MockClient((request) async {
      String json = "{}";
      return Response(json, 404);
    });

    expect(httpService.getBook("97816172941367"), throwsException);
  });
}