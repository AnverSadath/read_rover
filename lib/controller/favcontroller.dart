import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:read_rover/model/bookmodel.dart';
import 'package:hive/hive.dart';

class FavController extends ChangeNotifier {
  late Box<Map<dynamic, dynamic>> _favoriteBooksBox;

  FavController() {
    _initHive();
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    _favoriteBooksBox =
        await Hive.openBox<Map<dynamic, dynamic>>('favorite_books');
  }

  List<Map<dynamic, dynamic>> get favoriteBooks =>
      _favoriteBooksBox.values.toList();

  void addToFavorites(Item book) {
    final favBook = {
      'id': book.id,
      'title': book.volumeInfo?.title,
      'author':
          book.volumeInfo?.authors?.join(', '), // Assuming authors is a list
    };
    _favoriteBooksBox.put(book.id!, favBook);
    notifyListeners();
  }

  void removeFromFavorites(String bookId) {
    _favoriteBooksBox.delete(bookId);
    notifyListeners();
  }

  bool isBookFavorite(Item book) {
    return _favoriteBooksBox.containsKey(book.id);
  }
}
