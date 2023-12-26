import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:read_rover/view/Explore/explore.dart';
import 'package:read_rover/view/homepage/homepage.dart';
import 'package:read_rover/view/settings/settings.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  State<Bottombar> createState() => BottombarState();
}

class BottombarState extends State<Bottombar> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ExplorePage(),
    Settingspage()
  ];

  List<TabItem> tabItems = [
    TabItem(
      Icons.home,
      "Home",
      Colors.blue,
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
      ),
    ),
    TabItem(
      Icons.explore,
      "Explore",
      Colors.orange,
      labelStyle: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.settings,
      "Settings",
      Colors.cyan,
    ),
  ];

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircularBottomNavigation(
        tabItems,
        controller: _navigationController,
        selectedPos: selectedPos,
        barHeight: bottomNavBarHeight,
        barBackgroundColor: Colors.white,
        backgroundBoxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black45, blurRadius: 10.0),
        ],
        animationDuration: Duration(milliseconds: 300),
        selectedCallback: (int? selectedPos) {
          if (selectedPos != null && selectedPos != this.selectedPos) {
            setState(() {
              this.selectedPos = selectedPos;
            });
          }
        },
      ),
      body: _widgetOptions[selectedPos],
    );
  }
}
