
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petapp/Screens/MainPages/HomePage.dart';
import 'package:petapp/Screens/MainPages/LandingPage.dart';
import 'package:petapp/Screens/UserManagement/Signup.dart';

import '../../Component/RoundButton.dart';




class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        
        body: SingleChildScrollView(
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
                    "LOGIN HERE",
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
              
              SizedBox(
                height: 60,
              ),
              
              
              
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.white,
                              
                              ),
                              controller: emailController,
                              decoration: const InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon: Icon(Icons.alternate_email,
                                      color: Color(0xff6ED1BA)
                                      ),
                                  
                                  
                                  filled: true,
                   fillColor: Color(0xff306f60),     
                   hintStyle: (
                        TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                   
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            style: TextStyle(
                                color: Colors.white,
                              
                              ),
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock_open,
                                   color: Color(0xff6ED1BA)
                                 ),
                                
                                filled: true,
                   fillColor: Color(0xff306f60),     
                   hintStyle: (
                        TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                   
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter password';
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  RoundButton(
                    title: 'Login',
                    loading: loading,
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text.toString());
                  
                          if (emailController.text == "ctse@gmail.com" &&
                              passwordController.text == "123456") {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        } catch (e) {
                          print(e);
                        }
                  
                        setState(() {
                          loading = false;
                        });
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(
                          //         //builder:(context) => ForgotPasswordScreen())
                          // );
                        },
                        child: Text('Forgot Password?',
                            style: TextStyle(
                                color: Color(0xff6ED1BA),
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                        
                        
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text('Sign up',
                          
                          
                              style: TextStyle(
                                  color: Color(0xff6ED1BA),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                
                ],
              ),
            ),
            ]
          ),
        ),
      ),
    );
  }
}
