
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petapp/Screens/MainPages/HomePage.dart';
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
        backgroundColor: Color.alphaBlend(Colors.white10, Colors.black38),
        body: SingleChildScrollView(
          child: Column(
            children:[ 

              SizedBox(
                height: 50,
              ),
              
              
              Container(
                height: 300,
                
                child: Row(children: [
                      Container(
                        height: 240,
                        width: 200,
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hi Dear,',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Welcome Back',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 240,
                        width: 160,
                        child: Image.asset('assets/login.png'),
                      ),
                      
                ],)
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
                                      color: Color.fromARGB(255, 1, 11, 9)
                                      ),
                                  
                                  
                                  filled: true,
                   fillColor: Color(0xffDDA962),     
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
                                      color: Color.fromARGB(255, 1, 11, 9)
                                      ),
                                
                                filled: true,
                   fillColor: Color(0xffDDA962),     
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
                                color: Color(0xffDDA962),
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                        
                        
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?",
                      
                          style: TextStyle(
                              color: Color(0xffDDA962),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text('Sign up',
                              style: TextStyle(
                                  color: Color(0xffDDA962),
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
