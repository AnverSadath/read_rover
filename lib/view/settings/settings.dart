import 'package:flutter/material.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text("SETTINGS",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border_sharp,
                        size: 35,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Favorites",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  children: [
                    Icon(Icons.file_download_outlined),
                    Text("Downloads")
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 60,
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Row(
                  children: [Icon(Icons.info_rounded), Text("About")],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: OutlinedButton(
                  onPressed: () {},
                  child: Text("name"),
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only()))),
            )
            // Container(
            //   height: 60,
            //   width: 150,
            //   decoration:
            //       BoxDecoration(border: Border.all(color: Colors.black)),
            //   child: Row(
            //     children: [
            //       Icon(Icons.favorite_border_sharp),
            //       Text("Favourites")
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
