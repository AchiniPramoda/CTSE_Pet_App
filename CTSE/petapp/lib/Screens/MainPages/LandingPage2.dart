
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:petapp/Component/LandingRoundButton.dart';
import 'package:petapp/Screens/MainPages/HomePage.dart';
import 'package:petapp/Screens/UserManagement/Signin.dart';
import 'package:petapp/Screens/UserManagement/Signup.dart';

class LandingPage2 extends StatefulWidget {
  const LandingPage2({Key? key}) : super(key: key);

  @override
  _LandingPage2State createState() => _LandingPage2State();
}

class _LandingPage2State extends State<LandingPage2> {


 @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
        width: double.infinity,
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children:  [
            Image(image: AssetImage("assets/landingPage2.png"), width: 300,),

            SizedBox(
              height: 30
              ),
           
            Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
              LandingRoundButton(title: "Sign In", onTap: (){
                Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(builder: (ctx)=> const SignInScreen()));
              },),
            
              SizedBox(
                height: 40
                ),

              LandingRoundButton(title: "Sign Up", onTap: (){
                Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(builder: (ctx)=> const SignUpScreen()));
              },),

             
            
            
            ],
            ),
          ],
        )


      ),
    );
  }
 }
