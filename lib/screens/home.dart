import 'package:flutter/material.dart';
import 'package:itbook_flutter_demo/widgets/book_item.dart';
import 'package:itbook_flutter_demo/widgets/it_bookstore_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: const ItBookstoreLogo(height: 48),
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search books by Title, Author or ISBN',
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.all(16.0)
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Center(
                child: BookItem(imageUri: Uri.parse("https://itbook.store/img/books/9781617294136.png"),
                  title: "Securing DevOps",
                  price: "\$39.65"
                ),
              ),
              const SizedBox(
                height: 400,
                child: Center(
                  child: Text(
                    'This is an awesome shopping platform',
                  ),
                ),
              ),
              Container(
                height: 1000,
                color: Colors.pink,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}