import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_rover/controller/bookapi.dart';
import 'package:read_rover/view/detailpage/detailpage.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  void initState() {
    Provider.of<bookapicontroller>(context, listen: false).fetchdata3();
    Provider.of<bookapicontroller>(context, listen: false).fetchdata4();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookprovider = Provider.of<bookapicontroller>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Text(
                "EXPLORE",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 240, top: 35),
              child: Center(
                child: Text(
                  " Short Stories",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bookprovider.Responcemodel5?.items?.length ?? 0,
                itemBuilder: (context, index) {
                  final book = bookprovider.Responcemodel5?.items?[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            items: bookprovider.Responcemodel5!.items![index],
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  book?.volumeInfo?.imageLinks?.thumbnail ?? '',
                                ),
                              ),
                            ),
                            height: 220,
                            width: 140,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 300, top: 30),
              child: Center(
                child: Text(
                  " Novels",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bookprovider.Responcemodel6?.items?.length ?? 0,
                itemBuilder: (context, index) {
                  final book = bookprovider.Responcemodel6?.items?[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            items: bookprovider.Responcemodel6!.items![index],
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  book?.volumeInfo?.imageLinks?.thumbnail ?? '',
                                ),
                              ),
                            ),
                            height: 220,
                            width: 140,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
