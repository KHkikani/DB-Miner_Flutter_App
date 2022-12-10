import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isNotChangedPage = true;

  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment(0,0.5),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: NetworkImage(
                    "https://source.unsplash.com/random/?lion"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Spacer(flex: 3,),
            CircularProgressIndicator(),
            SizedBox(height: 25,),
            Text(
              "Get Started",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Spacer(flex: 1,),
          ],
        )
      ),
    );
  }
}
