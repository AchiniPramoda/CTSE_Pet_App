
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:petapp/Component/LandingRoundButton.dart';
import 'package:petapp/Screens/MainPages/HomePage.dart';
import 'package:petapp/Screens/MainPages/LandingPage2.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


 @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
        width: double.infinity,
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children:  [
            Image(image: AssetImage("assets/landingPage.png"), width: 300,),

            SizedBox(
              height: 30
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children:[ 
              Container(
              width: 270,
              height: 50,
              
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: const Center(
                child: Text("Let    Us    Give    The    Best \ Treatment", style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),

            Container(
              width: 270,
              height: 50,
              
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: const Center(
                child: Text("Get the best treamnet for your animals with us", style: TextStyle(
                  color: Colors.white54,
                  fontSize: 20,
                  
                ),),
              ),
            ),

            SizedBox(
              height: 30
              ),

          Container(
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  
                  SpinKitThreeInOut(
                    color: Colors.white10,
                    size: 50,
                    
                 ),


                 IconButton( 
                   onPressed: (){ Navigator.of(context).pushReplacement( CupertinoPageRoute(builder: (ctx)=> const LandingPage2()));},
                   icon: const Icon(Icons.arrow_circle_right_rounded, color: Color(0xffDDA962), size: 60),
                   ),


                 
              ],
             )
            ),
            
            ],
            ),
          ],
        )


      ),
    );
  }
 }
