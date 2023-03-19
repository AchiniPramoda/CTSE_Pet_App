
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:petapp/Screens/MainPages/LandingPage.dart';
import 'package:petapp/Screens/UserManagement/Signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 @override
 void initState() {
   super.initState();
   Future.delayed(const Duration(seconds: 3)).then((value) {
    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(builder: (ctx)=> const LandingPage()));
   } );
 }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: const [
            Image(image: AssetImage("assets/splashScreen.png"), width: 300,),

            SizedBox(
              height: 20
              ),

            SpinKitFadingCircle(
              color: Colors.white10,
              size: 50,
              ),
          ],
        )


      ),
    );
  }
 }
