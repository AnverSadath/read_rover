import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_rover/controller/bookapi.dart';
import 'package:read_rover/view/detailpage/detailpage.dart';

class NovelsPage extends StatefulWidget {
  const NovelsPage({super.key});

  @override
  State<NovelsPage> createState() => _NovelsPageState();
}

class _NovelsPageState extends State<NovelsPage> {
  @override
  void initState() {
    Provider.of<bookapicontroller>(context, listen: false).fetchdata4();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookprovider = Provider.of<bookapicontroller>(context);
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 200, top: 20),
              child: Container(
                child: Center(
                  child: Text(
                    "Novels",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 240, 193, 248),
                    Color.fromARGB(255, 194, 248, 242)
                  ]),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
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
                                items:
                                    bookprovider.Responcemodel6!.items![index]),
                          )),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    book?.volumeInfo?.imageLinks?.thumbnail ??
                                        '',
                                  ),
                                ),
                              ),
                              height: 220,
                              width: 140,
                            ),
                            Container(
                              height: 220,
                              width: 238,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        height: 240,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
