class Book {
  final String title;
  final String subtitle;
  final String? authors;
  final String? publisher;
  final String? language;
  final String? isbn10;
  final String isbn13;
  final int? pages;
  final int? year;
  final int? rating;
  final String? description;
  final String price;
  final Uri image;
  final Uri url;

  Book({
    required this.title,
    required this.subtitle,
    this.authors,
    this.publisher,
    this.language,
    this.isbn10,
    required this.isbn13,
    this.pages,
    this.year,
    this.rating,
    this.description,
    required this.price,
    required this.image,
    required this.url
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      authors: json['authors'] as String?,
      publisher: json['publisher'] as String?,
      language: json['language'] as String?,
      isbn10: json['isbn10'] as String?,
      isbn13: json['isbn13'] as String,
      pages: int.tryParse(json['pages'] ?? ""),
      year: int.tryParse(json['year'] ?? ""),
      rating: int.tryParse(json['rating'] ?? ""),
      description: json['desc'] as String?,
      price: json['price'] as String,
      image: Uri.parse(json['image']),
      url: Uri.parse(json['url']),
    );
  }
}