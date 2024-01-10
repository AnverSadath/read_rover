import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_rover/controller/favcontroller.dart';

class FavPage extends StatefulWidget {
  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Books'),
      ),
      body: _buildFavoriteBooksList(context),
    );
  }

  Widget _buildFavoriteBooksList(BuildContext context) {
    final favController = Provider.of<FavController>(context);

    // Get the list of favorite books from the controller
    final favoriteBooks = favController.favoriteBooks;

    return ListView.builder(
      itemCount: favoriteBooks.length,
      itemBuilder: (context, index) {
        final favBook = favoriteBooks[index];
        return ListTile(
          title: Text(favBook['title'] ?? ''),
          subtitle: Text(favBook['author'] ?? ''),
          // You can customize the ListTile to display other information about the book
        );
      },
    );
  }
}
