import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_quotes/global/global.dart';
import 'package:life_quotes/helper/quotesDBHelper.dart';
import 'package:life_quotes/utils/colors.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    print("${res['tableName']}");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColors,
          ),
        ),
        title: Text(
          "Quotes by ${res['pageName']}",
          style: GoogleFonts.slabo27px(
              color: AppColors.primaryColors,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: FutureBuilder(
        future: QuotesDBHelper.quotesDBHelper.fetch(
            tableName: "${res['tableName']}", colName: "${res['tableName']}"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Map<String, dynamic>>? data = snapshot.data;
            print(data);

            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("quotesPage",
                          arguments:
                              data[index]['${res['tableName']}'].toString());
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ProfilePicture(
                          name: '${data[index]['${res['tableName']}']}',
                          radius: 40,
                          fontsize: 30,
                          random: true,
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "${data[index]['${res['tableName']}']}",
                              style: GoogleFonts.crimsonPro(
                                color: AppColors.primaryColors,
                                fontSize: 25,
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide())),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
