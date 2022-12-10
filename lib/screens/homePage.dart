import 'package:flutter/material.dart';
import 'package:life_quotes/global/global.dart';
import 'package:life_quotes/helper/quotesDBHelper.dart';
import 'package:life_quotes/model/quotesModel.dart';
import 'package:life_quotes/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:life_quotes/screens/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: Global.homePageGlobalKey);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Quotes>> fetchSliderQuotes;

  @override
  void initState() {
    super.initState();

    fetchSliderQuotes =
        QuotesDBHelper.quotesDBHelper.fetchDisplaySliderQuotes(length: '35');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: drawer(context: context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.black));
        }),
        title: Text(
          "Life Quotes and Sayings",
          style: GoogleFonts.slabo27px(
              color: AppColors.primaryColors,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: fetchSliderQuotes,
                builder: (context, snapshot) {
                  print(snapshot.data?.length);
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    List<Quotes>? allQuotes = snapshot.data;

                    return CarouselSlider(
                      items: allQuotes!
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("detailsPage", arguments: e);
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://source.unsplash.com/random/${allQuotes.indexOf(e)}?background,nature,light"),
                                      fit: BoxFit.cover,
                                      opacity: 0.65),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Center(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${e.quote}",
                                      style: GoogleFonts.eczar(
                                        color: AppColors.primaryColors,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        " - ${e.author}",
                                        style: GoogleFonts.eczar(
                                          color: AppColors.primaryColors,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        height: 225,
                        autoPlay: true,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('categoriesPage',
                          arguments: {
                            'pageName': 'Categories',
                            'tableName': 'tags'
                          });
                      // CatOrAuthArgs args = CatOrAuthArgs(
                      //     title: 'Categories', isAuthorCat: false);

                      // Navigator.of(context).pushNamed(
                      //     'category_or_author_page',
                      //     arguments: args);
                    },
                    child: Global.options(
                      color: const Color(0xffA45584),
                      icon: Icons.grid_view,
                      text: "Categories",
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('categoriesPage',
                          arguments: {
                            'pageName': 'Authors',
                            'tableName': 'author'
                          });

                      // Arguments args = Arguments(
                      //     title: "Pic", isAuthCat: false, name: 'pic');
                      // Navigator.of(context)
                      //     .pushNamed('categoriesPage');
                    },
                    child: Global.options(
                      color: const Color(0xff7589C8),
                      icon: Icons.person,
                      text: "Author",
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("quotesPage", arguments: "latest");

                      // Arguments args = Arguments(
                      //     title: 'Latest', isAuthCat: false, name: 'pic');

                      // Navigator.of(context)
                      //     .pushNamed('quotes_page', arguments: args);
                    },
                    child: Global.options(
                      color: const Color(0xffB99041),
                      icon: Icons.sunny,
                      text: "Latest",
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("quotesPage", arguments: "Articles");
                    },
                    child: Global.options(
                      color: const Color(0xff6C9978),
                      icon: Icons.menu_book_sharp,
                      text: "Articles",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            (Global.homePageState)?Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quotes by Category",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('categoriesPage',
                              arguments: {
                                'pageName': 'Categories',
                                'tableName': 'tags'
                              });
                        },
                        child: Text(
                          "View All >",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: width,
                    child: FutureBuilder(
                      future: QuotesDBHelper.quotesDBHelper
                          .fetch(tableName: 'tags', colName: "tags"),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("${snapshot.error}"),
                          );
                        } else if (snapshot.hasData) {
                          List<Map<String, dynamic>>? data = snapshot.data;
                          print(data);

                          return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: 4,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed("quotesPage",
                                    arguments: "${data[index]['tags']}");
                              },
                              child: GridTile(
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 25),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://source.unsplash.com/random/$index?${data![index]['tags']}"),
                                          fit: BoxFit.cover,
                                          opacity: 0.75),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  footer: Text(
                                    "${data[index]['tags']}",
                                    style: GoogleFonts.merienda(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ):CircularProgressIndicator(),
            const SizedBox(height: 14),
            (Global.homePageState)?
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Quotes by Authors",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('categoriesPage',
                              arguments: {
                                'pageName': 'Authors',
                                'tableName': 'author'
                              });
                        },
                        child: Text(
                          "View All >",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: width,
                    child: FutureBuilder(
                      future: QuotesDBHelper.quotesDBHelper
                          .fetch(tableName: 'author', colName: "author"),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("${snapshot.error}"),
                          );
                        } else if (snapshot.hasData) {
                          List<Map<String, dynamic>>? data = snapshot.data!;
                          return GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: 4,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed("quotesPage",
                                    arguments: "${data[index]['author']}");
                              },
                              child: GridTile(
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 25),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://source.unsplash.com/random/$index?${data[index]['author']}"),
                                          fit: BoxFit.cover,
                                          opacity: 0.75),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                  footer: Text(
                                    "${data[index]['author']}",
                                    style: GoogleFonts.merienda(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ):CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
