import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_quotes/model/quotesModel.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late NetworkImage img;

  double activeFontSize = 22;
  Color? activeFontColor = Colors.white;
  String activeFontStyle = "Lato";
  bool actionShow = false;

  // late TextStyle activeTextStyle;

  List<Map<String, dynamic>> actionRow1 = [
    {
      'actionName': "Size",
      'actions': <double>[12, 14, 16, 18, 20, 22, 24, 26, 28],
    },
    {
      'actionName': "Color",
      'actions': <Color>[
        Colors.white,
        Colors.blue,
        Colors.red,
        Colors.green,
        Colors.teal,
        Colors.purple,
        Colors.amber,
        Colors.cyanAccent,
        Colors.indigo,
      ],
    },
    {
      'actionName': "Font",
      'actions': <String>[
        "Lato",
        "Poppins",
        "Noto Sans",
        "Lobster",
        "Mukta",
        "Nunito",
        "PT Sans",
        "Kanit",
        "Kenia",
      ],
    },
  ];
  late Map<String, dynamic> actionRow2;

  int imgNo = 1;

  // int textFont = 1;
  // List<TextStyle> textStyle = ;

  @override
  void initState() {
    actionRow2 = actionRow1[0];
    img = NetworkImage(
        "https://source.unsplash.com/random/?background,nature,light");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Quotes res = ModalRoute.of(context)!.settings.arguments as Quotes;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.darken,
              ),
              image: NetworkImage(
                  "https://source.unsplash.com/random/$imgNo?background,nature,light"),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                Text(
                  "${res.quote} \n\n - ${res.author}",
                  style: GoogleFonts.getFont(
                    activeFontStyle,
                    textStyle: TextStyle(
                      color: activeFontColor,
                      fontWeight: FontWeight.w600,
                      fontSize: activeFontSize,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(flex: 2),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 55,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              imgNo++;
                            });
                          },
                          icon: const Icon(
                            Icons.camera,
                            color: Colors.teal,
                          )),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            actionShow = !actionShow;
                          });
                        },
                        icon: const Icon(
                          Icons.text_fields_sharp,
                          color: Colors.blueGrey,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.copy, color: Colors.blue)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_downward,
                              color: Colors.green)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.star_border,
                              color: Colors.blue)),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
        (actionShow)
            ? Positioned(
                bottom: 125,
                right: 5,
                left: 5,
                child: Container(
                    height: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: actionRow1
                                .map<Widget>((e) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          actionRow2 = e;
                                        });
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        child: Text(
                                          "${e['actionName']}",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList()),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: actionRow2['actions']
                                .map<Widget>((e) => GestureDetector(
                                      onTap: () {
                                        if (e.runtimeType == double) {
                                          setState(() {
                                            activeFontSize = e;
                                          });
                                        } else if (e.runtimeType == String) {
                                          setState(() {
                                            activeFontStyle = e;
                                          });
                                        } else {
                                          setState(() {
                                            activeFontColor = e;
                                          });
                                        }
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 10),
                                          child: (e.runtimeType == double)
                                              ? Text(
                                                  "${e.toString().split(".")[0]}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                )
                                              : (e.runtimeType == String)
                                                  ? Text(
                                                      "Sample",
                                                      style: GoogleFonts.getFont(
                                                          e,
                                                          textStyle: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .white)),
                                                    )
                                                  : Container(
                                                      color: e,
                                                      height: 25,
                                                      width: 25,
                                                    )),
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    )),
              )
            : Container(),
      ],
    ));
  }
}
