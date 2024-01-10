import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class FavModelClass extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? author;

  // Add more fields as needed

  FavModelClass({this.id, this.title, this.author});
}
