import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:read_rover/controller/bookapi.dart';

import 'package:read_rover/view/Bottombar/Bottomnav.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => bookapicontroller(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Bottombar(),
      ),
    );
  }
}
