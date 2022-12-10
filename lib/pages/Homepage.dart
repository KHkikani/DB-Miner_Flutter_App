import 'package:flutter/material.dart';
import '../models/animalModel.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {




@override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            )),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
        ],
        centerTitle: true,
        title: const Text("ANIMAL BIOGRAPHY"),
        backgroundColor: Colors.black87,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        children: AnimalsType.animalType
            .map((e) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("animalPage",arguments: "$e");
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 350,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://source.unsplash.com/random/?$e"
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.20),
                            offset: const Offset(0, 0),
                            blurRadius: 5,
                            spreadRadius: 3,
                          )
                        ]),
                    child: Container(
                      alignment: Alignment.center,
                      height: 65,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(11),
                            bottomRight: Radius.circular(11)),
                        color: Colors.black.withOpacity(0.50),
                      ),
                      child: Text(
                        "$e Animal",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
      backgroundColor: const Color(0xffEDEDED),
    );
  }
}
