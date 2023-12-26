import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:read_rover/view/homepage/homepage.dart';

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
    HomePage(),
    HomePage(),
    HomePage(),
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
      Icons.search,
      "Search",
      Colors.orange,
      labelStyle: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.layers,
      "Reports",
      Colors.red,
      circleStrokeColor: Colors.black,
    ),
    TabItem(
      Icons.notifications,
      "Notifications",
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
