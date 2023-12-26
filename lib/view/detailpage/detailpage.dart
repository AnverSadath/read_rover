import 'package:flutter/material.dart';
import 'package:read_rover/view/Bottombar/Bottomnav.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required item});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.ios_share_sharp),
              iconSize: 30,
            )
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bottombar(),
                    ));
              },
              icon: Icon(Icons.arrow_back_ios_new))),
    );
  }
}
