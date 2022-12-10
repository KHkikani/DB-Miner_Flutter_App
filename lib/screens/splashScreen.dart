import 'package:flutter/material.dart';
import 'package:life_quotes/global/global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  moveNext() async {
     Global.createDataAndTable();
    Future.delayed(Duration(seconds: 10),(){
        Navigator.of(context).pushNamed("HomePage");
    });
    // if (res) {
    //   Navigator.of(context).pushNamed("HomePage");
    // }
  }

  @override
  void initState() {
    super.initState();
    moveNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text("Wait...."),
          ],
        ),
      ),
    );
  }
}
