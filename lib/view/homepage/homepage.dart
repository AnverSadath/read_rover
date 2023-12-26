import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:read_rover/controller/bookapi.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<bookapicontroller>(context, listen: false).fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookprovider = Provider.of<bookapicontroller>(context);

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text(
                    "READ ROVER",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  CarouselSlider.builder(
                    itemCount: bookprovider.Responcemodel3?.items?.length ?? 0,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final book = bookprovider.Responcemodel3?.items?[index];
                      final thumbnailUrl = book
                              ?.volumeInfo?.imageLinks?.smallThumbnail
                              ?.toString() ??
                          '';

                      return Container(
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                          image: thumbnailUrl.isNotEmpty
                              ? DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(thumbnailUrl),
                                )
                              : null,
                        ),
                        child: thumbnailUrl.isEmpty
                            ? Center(child: Text("No Image"))
                            : null,
                      );
                    },
                    options: CarouselOptions(
                      height: 260,
                      aspectRatio: 12 / 9,
                      viewportFraction: 0.5,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 210, top: 40),
                    child: Container(
                      child: Center(
                        child: Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 223, 218, 218),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 55,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount:
                          bookprovider.Responcemodel3?.items?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Center(
                            child: Text(
                              bookprovider.Responcemodel3?.items?[index]
                                      .volumeInfo?.categories
                                      .toString() ??
                                  "",
                            ),
                          ),
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 220, top: 20),
                    child: Text(
                      " Recently Added",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: bookprovider.Responcemodel3?.items?.length ?? 0,
                    itemBuilder: (context, index) {
                      final book = bookprovider.Responcemodel3?.items?[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //color: Colors.cyan,
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          book?.volumeInfo?.imageLinks
                                                  ?.thumbnail ??
                                              '',
                                        ))),
                                height: 220,
                                width: 140,
                              ),
                              Container(
                                //color: Colors.amber,
                                height: 220,
                                width: 255,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20),
                                      Text(
                                        book?.volumeInfo?.title ?? "",
                                        style: TextStyle(fontSize: 20),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Text(
                                        book?.volumeInfo?.authors?.join(", ") ??
                                            "",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.cyan,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                      Text(
                                        book?.volumeInfo?.description ?? "",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          height: 220,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
