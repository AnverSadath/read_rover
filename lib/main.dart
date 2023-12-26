import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_rover/controller/bookapi.dart';
import 'package:read_rover/view/homepage/Bottombar/Bottomnav.dart';
// import 'package:read_rover/view/homepage/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _readroverState();
}

class _readroverState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => bookapicontroller()),
      ],
      child: MaterialApp(
        home: Bottombar(),
      ),
    );
  }
}
