import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petapp/Component/Util.dart';
import 'package:petapp/Screens/MainPages/HomePage.dart';
import 'package:petapp/Screens/MainPages/LandingPage.dart';
import 'package:petapp/Screens/UserManagement/Signin.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool loading = false ;
  bool showSpinner = false ;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

 FirebaseAuth  _auth = FirebaseAuth.instance;
String email = '', password = '';

  @override

  @override
  void dispose() {
    
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

  }


  
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
             SingleChildScrollView(
              
                child: Column(
                  children:[ 
                    
                    Container(
            margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              width: double.infinity,
              height: 250, 
              decoration: BoxDecoration(
               
                color: Color(0x1f000000),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                border: Border.all(color: Color(0xff6ED1BA), width: 2),  
               ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: const Text(
                    "Register Here",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
              color: Colors.white,
              height: 16,
              thickness: 7,
              indent: 100,
              endIndent: 100,
            ), 
              ],
            ),
            ),
                    
                    
                    
                    
                    
                    
                    
                    
                    Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                       
                
                
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  style: TextStyle(
                                  color: Colors.white,
                              fontSize: 19,
                                ),
                                  controller: emailController,
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Please enter email';
                                    }
                                    return null;
                                  },
                                    decoration: InputDecoration(
                                    filled: true,
                                fillColor: Color(0xff306f60),     
                                hintStyle: (
                                   TextStyle(
                                        color: Colors.white,
                                      fontSize: 16,
                                       fontWeight: FontWeight.bold,
                                  )
                             ),
                   
                                   hintText: 'Insert Your E-Mail',
                
                                border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                    ),
                   
                                  ),
                                  onChanged: (String value) {
                                    email = value;
                           
                                    
                                  },
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                   style: TextStyle(
                                  color: Colors.white,
                              fontSize: 19,
                                ),
                                  controller: passwordController,
                                 keyboardType: TextInputType.visiblePassword,
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return 'Please enter password';
                                    }
                                    return null;
                                  },
                                 decoration: InputDecoration(
                                    filled: true,
                                fillColor: Color(0xff306f60),     
                                hintStyle: (
                                   TextStyle(
                                        color: Colors.white,
                                      fontSize: 16,
                                       fontWeight: FontWeight.bold,
                                  )
                             ),
                   
                                   hintText: 'Insert Password',
                
                                
                      border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(

                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                    ),
                   
                                  ),
                                  onChanged: (String value) {
                                    password = value;
                               
                                  },
                                ),
                              ),
                        
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () async{
                            if(_formKey.currentState!.validate()){
                            
                              _auth.createUserWithEmailAndPassword(
                                    email: emailController.text.toString().trim(),
                                    password: passwordController.text.toString()).then((value){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(),
                                        ),
                                      );
                                    }
                                    ).onError((error, stackTrace) {
                                      Utils().toastMessage(error.toString());
                            });
                              
                            }
                          },
                           color: Color(0xff003F36),
                           elevation: 3,
                           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                                shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(19),
                                      side: BorderSide(color: Color(0xff6ED1BA), width: 2),
              ),
                          height: 20,
                          minWidth: 180,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?',),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Color(0xff6ED1BA),
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                  ]
                ),
              ),
          
            ]
          ),
        ),
      ),
    );
  }
}

void toastMessage(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}



