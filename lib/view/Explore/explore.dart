import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_rover/controller/bookapi.dart';
import 'package:read_rover/view/detailpage/detailpage.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Provider.of<bookapicontroller>(context, listen: false).fetchdata3();
    Provider.of<bookapicontroller>(context, listen: false).fetchdata4();
    Provider.of<bookapicontroller>(context, listen: false).fetchdata5();
    Provider.of<bookapicontroller>(context, listen: false)
        .fetchdata8(search: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<bookapicontroller>(context);

    bool showSearchResults = bookProvider.Responcemodel7 != null &&
        bookProvider.Responcemodel7!.items != null &&
        bookProvider.Responcemodel7!.items!.isNotEmpty;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "EXPLORE",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Search Books',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        String searchTerm = searchController.text.trim();
                        if (searchTerm.isNotEmpty) {
                          Provider.of<bookapicontroller>(context, listen: false)
                              .fetchdata8(search: searchTerm);
                        } else {
                          Provider.of<bookapicontroller>(context, listen: false)
                              .fetchdata3();
                          Provider.of<bookapicontroller>(context, listen: false)
                              .fetchdata4();
                          Provider.of<bookapicontroller>(context, listen: false)
                              .fetchdata5();
                        }
                      },
                    ),
                  ),
                ),
              ),
              if (showSearchResults)
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bookProvider.Responcemodel7!.items!.length,
                  itemBuilder: (context, index) {
                    final book = bookProvider.Responcemodel7!.items![index];
                    return buildBookItem(book, bookProvider);
                  },
                )
              else
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 240, top: 20),
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
                        itemCount:
                            bookProvider.Responcemodel5?.items?.length ?? 0,
                        itemBuilder: (context, index) {
                          final book =
                              bookProvider.Responcemodel5?.items?[index];
                          return buildBookItem(book, bookProvider);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 300, top: 20),
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
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            bookProvider.Responcemodel6?.items?.length ?? 0,
                        itemBuilder: (context, index) {
                          final book =
                              bookProvider.Responcemodel6?.items?[index];
                          return buildBookItem(book, bookProvider);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 300, top: 20),
                      child: Center(
                        child: Text(
                          " History",
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
                        itemCount:
                            bookProvider.Responcemodel8?.items?.length ?? 0,
                        itemBuilder: (context, index) {
                          final book =
                              bookProvider.Responcemodel8?.items?[index];

                          return buildBookItem(book, bookProvider);
                        },
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBookItem(book, bookapicontroller bookProvider) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              items: book,
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
                    book.volumeInfo?.imageLinks?.thumbnail ?? '',
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
  }
}
