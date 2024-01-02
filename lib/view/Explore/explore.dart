import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_rover/controller/bookapi.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    Provider.of<bookapicontroller>(context, listen: false).fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookprovider = Provider.of<bookapicontroller>(context);
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }
}
