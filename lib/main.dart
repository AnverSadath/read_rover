import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:read_rover/controller/bookapi.dart';
import 'package:read_rover/controller/favcontroller.dart';

import 'package:read_rover/view/Bottombar/Bottomnav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FavController().initializeHive();
  await Hive.initFlutter();
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
        ChangeNotifierProvider(create: (context) => FavController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Bottombar(),
      ),
    );
  }
}
