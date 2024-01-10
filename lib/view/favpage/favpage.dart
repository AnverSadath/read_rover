import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_rover/controller/favcontroller.dart';
import 'package:read_rover/model/favmodel.dart';

class FavPage extends StatefulWidget {
  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  late FavController favController;

  @override
  void initState() {
    super.initState();
    favController = Provider.of<FavController>(context, listen: false);
    _initializeHive();
  }

  Future<void> _initializeHive() async {
    await favController.initializeHive();
    setState(() {}); // Trigger a rebuild after initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: _buildFavoriteBooksList(),
    );
  }

  Widget _buildFavoriteBooksList() {
    if (favController.favoriteBooks.isEmpty) {
      return Center(
        child: Text('No favorite books yet.'),
      );
    }

    return ListView.builder(
      itemCount: favController.favoriteBooks.length,
      itemBuilder: (context, index) {
        final Map<dynamic, dynamic> bookData =
            favController.favoriteBooks[index];

        // Convert Map to FavModelClass
        final FavModelClass book = FavModelClass(
          id: bookData['id'],
          title: bookData['title'],
          author: bookData['author'],
          // Add more fields as needed
        );

        return ListTile(
          title: Text(book.title ?? ''),
          subtitle: Text(book.author ?? ''),
          // Other properties of FavModelClass can be accessed here
        );
      },
    );
  }
}
