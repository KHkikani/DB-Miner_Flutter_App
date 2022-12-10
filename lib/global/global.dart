import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_quotes/helper/quotesAPIHelper.dart';
import 'package:life_quotes/helper/quotesDBHelper.dart';
import 'package:life_quotes/model/quotesModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {

 static GlobalKey homePageGlobalKey = GlobalKey();
 static bool homePageState = false;

  static Set allAuthor = <String>{};
  static Set tags = <String>{};

  static Future<bool> createDataAndTable() async {
    await QuotesDBHelper.quotesDBHelper.initDB();
    int page = 1;
    while (true) {
      List<Quotes>? res =
          await QuotesAPIHelper.quotesAPIHelper.getQuotes(pageNO: page);
      if (res!.isNotEmpty) {
        res.forEach((element) async {
          element.tags.forEach((tagName) {
            tags.add(tagName);
          });

          allAuthor.add(element.author);
          int? res =
              await QuotesDBHelper.quotesDBHelper.insertRecord(data: element);
          // print("res ---  $res ");

          // print(element.author);
        });
        page++;
        print("Page   -  $page");

        //
        // fetchSliderQuotes =
        //     QuotesDBHelper.quotesDBHelper.fetchDisplaySliderQuotes();

      } else {

        allAuthor.toList().forEach((element) async {
          await QuotesDBHelper.quotesDBHelper.insert(tableName: "author", colName: "author", data: "$element");
        });
        tags.toList().forEach((element) async {
          await QuotesDBHelper.quotesDBHelper.insert(tableName: "tags", colName: "tags", data: "$element");

        });

        print("-------------------------");
        print(allAuthor.length);
        print(tags.length);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('hasInitDB', true);
        homePageState = true;
        homePageGlobalKey.currentState?.setState(() {

        });
        return true;
      }
    }

  }

  static Widget options(
      {required Color color, required IconData icon, required String text}) {
    return Container(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            height: 50,
            width: 50,
            child: Icon(icon, color: Colors.white, size: 26),
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }


}
