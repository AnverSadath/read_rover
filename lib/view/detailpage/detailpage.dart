import 'package:flutter/material.dart';
import 'package:read_rover/model/bookmodel.dart';
import 'package:read_rover/view/Bottombar/Bottomnav.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.items});
  final Item items;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isExpanded = false;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              width: double.infinity,
              // color: Colors.amber,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Image.network(
                      widget.items.volumeInfo?.imageLinks?.thumbnail
                              .toString() ??
                          "",
                      fit: BoxFit.cover,
                    ),
                    height: 240,
                    width: 150,
                    color: Colors.black,
                  ),
                ),
                Container(
                  height: 220,
                  width: 245,
                  // color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          widget.items.volumeInfo?.title ?? "",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.items.volumeInfo?.authors?.join(',') ?? "",
                          style:
                              TextStyle(fontSize: 18, color: Colors.blueGrey),
                        ),
                        SizedBox(height: 10),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(10)),
                            height: 25,
                            width: 80,
                            child: Center(
                              child: Text(
                                widget.items.volumeInfo?.categories
                                        ?.join(',') ??
                                    "",
                                style: TextStyle(color: Colors.indigo),
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 190),
              child: Text(
                "Book Description",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
            ),
            Divider(
              color: const Color.fromARGB(255, 228, 220, 220),
              thickness: 2.2,
              indent: 14,
              endIndent: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(17),
              child: Column(
                children: [
                  isExpanded
                      ? Text(
                          widget.items.volumeInfo?.description.toString() ?? "",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16),
                        )
                      : Text(
                          widget.items.volumeInfo?.description.toString() ?? "",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(isExpanded ? "Read Less" : "Read More",
                    style: TextStyle(fontSize: 15)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
