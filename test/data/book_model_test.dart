import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:itbook_flutter_demo/data/book_model.dart';

void main() {
  test("Partial book entry should be parsed without errors.", () async {
      String jsonPayload = await File("./test/data/fixtures/search_results.json").readAsString();
      Map<String, dynamic> searchResults = jsonDecode(jsonPayload);
      var book = Book.fromJson(searchResults["books"][0]);

      expect(book.title, "Building Games with Flutter");
      expect(book.subtitle, "The ultimate guide to creating multiplatform games using the Flame engine in Flutter 3");
      expect(book.authors, null);
      expect(book.publisher, null);
      expect(book.language, null);
      expect(book.isbn10, null);
      expect(book.isbn13, "9781801816984");
      expect(book.pages, null);
      expect(book.year, null);
      expect(book.rating, null);
      expect(book.description, null);
      expect(book.price, "\$39.99");
      expect(book.image, Uri.parse("https://itbook.store/img/books/9781801816984.png"));
      expect(book.url, Uri.parse("https://itbook.store/books/9781801816984"));
    });

  test("Book details are parsed without errors.", () async {
    String jsonPayload = await File("./test/data/fixtures/book_details.json").readAsString();
    Map<String, dynamic> searchResults = jsonDecode(jsonPayload);
    var book = Book.fromJson(searchResults);

    expect(book.title, "Securing DevOps");
    expect(book.subtitle, "Security in the Cloud");
    expect(book.authors, "Julien Vehent");
    expect(book.publisher, "Manning");
    expect(book.language, "English");
    expect(book.isbn10, "1617294136");
    expect(book.isbn13, "9781617294136");
    expect(book.pages, 384);
    expect(book.year, 2018);
    expect(book.rating, 5);
    expect(book.description, "An application running in the cloud can benefit from incredible efficiencies, but they come with unique security threats too. A DevOps team&#039;s highest priority is understanding those risks and hardening the system against them.Securing DevOps teaches you the essential techniques to secure your c...");
    expect(book.price, "\$39.65");
    expect(book.image, Uri.parse("https://itbook.store/img/books/9781617294136.png"));
    expect(book.url, Uri.parse("https://itbook.store/books/9781617294136"));
  });
}