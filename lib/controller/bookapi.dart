import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:read_rover/model/bookmodel.dart';
import 'package:http/http.dart' as http;

class bookapicontroller extends ChangeNotifier {
  ReadApiResponce? Responcemodel3;
  ReadApiResponce? Responcemodel4;
  ReadApiResponce? Responcemodel5;
  ReadApiResponce? Responcemodel6;
  ReadApiResponce? Responcemodel7;
  ReadApiResponce? Responcemodel8;
  ReadApiResponce? Responcemodel9;
  bool loading = false;

  fetchdata() async {
    final Url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=novels,stories,shortstories,&key=AIzaSyCU4rCPfnvJsjX0mJXq_8da6s1XYTvvx1w");
    ;
    var responce2 = await http.get(Url);
    var decodedata = (jsonDecode(responce2.body));
    print(responce2.body);
    print(responce2.statusCode);
    Responcemodel3 = ReadApiResponce.fromJson(decodedata);

    notifyListeners();
  }

  fetchdata2({required String name}) async {
    final Url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=author=$name&key=AIzaSyCU4rCPfnvJsjX0mJXq_8da6s1XYTvvx1w");
    ;
    var responce2 = await http.get(Url);
    var decodedata = (jsonDecode(responce2.body));
    print(responce2.body);
    print(responce2.statusCode);
    Responcemodel4 = ReadApiResponce.fromJson(decodedata);

    notifyListeners();
  }

  fetchdata3() async {
    final Url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=shortstories&key=AIzaSyCU4rCPfnvJsjX0mJXq_8da6s1XYTvvx1w");
    ;
    var responce2 = await http.get(Url);
    var decodedata = (jsonDecode(responce2.body));
    print(responce2.body);
    print(responce2.statusCode);
    Responcemodel5 = ReadApiResponce.fromJson(decodedata);

    notifyListeners();
  }

  fetchdata4() async {
    final Url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=Novels&key=AIzaSyCU4rCPfnvJsjX0mJXq_8da6s1XYTvvx1w");
    ;
    var responce2 = await http.get(Url);
    var decodedata = (jsonDecode(responce2.body));
    print(responce2.body);
    print(responce2.statusCode);
    Responcemodel6 = ReadApiResponce.fromJson(decodedata);

    notifyListeners();
  }

  Future<void> fetchdata8({required String search}) async {
    final Url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=$search=fullbooks&Key=AIzaSyCU4rCPfnvJsjX0mJXq_8da6s1XYTvvx1w");
    var response = await http.get(Url);

    if (response.statusCode == 200) {
      var decodedata = jsonDecode(response.body);
      Responcemodel7 = ReadApiResponce.fromJson(decodedata);
    } else {
      print('Error fetching search data: ${response.statusCode}');
    }

    notifyListeners();
  }

  fetchdata5() async {
    final Url = Uri.parse(
        "https://www.googleapis.com/books/v1/volumes?q=history&key=AIzaSyCU4rCPfnvJsjX0mJXq_8da6s1XYTvvx1w");
    ;
    var responce2 = await http.get(Url);
    var decodedata = (jsonDecode(responce2.body));
    print(responce2.body);
    print(responce2.statusCode);
    Responcemodel8 = ReadApiResponce.fromJson(decodedata);

    notifyListeners();
  }

  // Future<void> downloadPDF(String pdfUrl) async {
  //   final response = await http.get(Uri.parse(
  //       "https://www.googleapis.com/books/v1/volumes?q=novels,stories,shortstories,&key=AIzaSyCU4rCPfnvJsjX0mJXq_8da6s1XYTvvx1w"));
  //   final documentDirectory = await getApplicationDocumentsDirectory();
  //   final file = File("${documentDirectory.path}/downloaded_book.pdf");

  //   await file.writeAsBytes(response.bodyBytes);

  //   notifyListeners();
  // }
}
