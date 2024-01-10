import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:read_rover/model/bookmodel.dart';

class FavController extends ChangeNotifier {
  late Box<Map<dynamic, dynamic>>? _favoriteBooksBox; // Change here

  FavController() {
    print('FavController constructor');
    initializeHive();
  }

  Future<void> _initHive() async {
    print('Initializing Hive...');
    await Hive.initFlutter();
    _favoriteBooksBox =
        await Hive.openBox<Map<dynamic, dynamic>>('favorite_books');
    print('Hive initialized.');
  }

  Future<void> initializeHive() async {
    await _initHive();
  }

  List<Map<dynamic, dynamic>> get favoriteBooks {
    if (_favoriteBooksBox == null || !_favoriteBooksBox!.isOpen) {
      throw Exception('Hive box not initialized yet');
    }
    return _favoriteBooksBox!.values.toList();
  }

  void addToFavorites(Item book) {
    if (_favoriteBooksBox != null) {
      final favBook = {
        'id': book.id,
        'title': book.volumeInfo?.title,
        'author': book.volumeInfo?.authors?.join(', '),
        'image': book.volumeInfo?.imageLinks?.thumbnail,
      };
      _favoriteBooksBox!.put(book.id!, favBook);
      notifyListeners();
    }
  }

  void removeFromFavorites(String bookId) {
    _favoriteBooksBox?.delete(bookId);
    notifyListeners();
  }

  bool isBookFavorite(Item book) {
    return _favoriteBooksBox?.containsKey(book.id) ?? false;
  }
}
