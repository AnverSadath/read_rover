import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_rover/model/bookmodel.dart';
import 'package:http/http.dart' as http;

class bookapicontroller extends ChangeNotifier {
  ReadApiResponce? Responcemodel3;

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
}
