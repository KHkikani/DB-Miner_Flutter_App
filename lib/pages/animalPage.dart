import 'package:animal_biography_app/Helpers/Database_Helper.dart';
import 'package:flutter/material.dart';

import '../models/animalModel.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({Key? key}) : super(key: key);

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
          },
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text("$res Animal"),
      ),
      body: FutureBuilder(
        future: DBHelper.dbHelper.fetchData(type: '$res'),
        builder: (BuildContext context, AsyncSnapshot<List<Animal>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Animal>? allAnimalsList = snapshot.data;
            print(allAnimalsList);
            return Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://source.unsplash.com/random/?$res"),
                        fit: BoxFit.cover,
                      )),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.white,
                          Colors.transparent,
                        ])),
                  ),
                ),
                ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 80,
                      width: double.infinity,
                    ),
                    Text(
                      "$res} \nAnimal",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: allAnimalsList!
                            .map((e) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  height: 370,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.black87, width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.20),
                                          offset: const Offset(0, 0),
                                          blurRadius: 5,
                                          spreadRadius: 3,
                                        )
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 200,
                                        width: 250,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          color: Colors.white,
                                          image: DecorationImage(
                                              image: NetworkImage(e.image),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              e.description,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
