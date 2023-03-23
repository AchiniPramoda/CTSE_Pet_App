import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:petapp/Component/RoundButton.dart';
import 'package:petapp/Screens/MainPages/LandingPage.dart';

import '../../Component/Util.dart';

  late AnimationController controller;
  late Animation<double> animation;


class InsertDogTraining extends StatefulWidget {
  const InsertDogTraining({Key? key}) : super(key: key);
  

  @override
  State<InsertDogTraining> createState() => _InsertDogTrainingState();
}

class _InsertDogTrainingState extends State<InsertDogTraining> {

    final _formKey = GlobalKey<FormState>();
    final databaseRef = FirebaseDatabase.instance.ref().child('Traing');
    firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
    File? _image;
    bool loading = false ;
   final picker = ImagePicker();
   FirebaseAuth _auth = FirebaseAuth.instance;

   final nameController = TextEditingController();
   final tainingDetailsController = TextEditingController();
   final tainingcatgoryController = TextEditingController();
   



Future getImageG() async {
  final pickedFile = await  picker.getVideo(source: ImageSource.camera, maxDuration: Duration(seconds: 10));

  setState(() {
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected !');
    }
  });
}

Future getImageC() async {
  // ignore: deprecated_member_use
  final pickedFile = await picker.getVideo(source: ImageSource.camera, maxDuration: Duration(seconds: 10));

  setState(() {
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No Video selected.');
    }
  });
}

 void dialog (context){
   showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Color.alphaBlend(Color(0xffDDA962), Color(0xffDDA962)),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          content: Container(
            height:120,

            child: Column(
              children:[
                InkWell(
                  onTap: (){
                    getImageC();
                    Navigator.pop(context);
                 

                  },
                  child:ListTile(
                    leading: Icon(Icons.camera),
                    title: Text('Camera'),
                )
                
             
                ),
                InkWell(
                  onTap: (){
                    getImageG();
                    Navigator.pop(context);
                  },
              
                  child:ListTile(
                    title: Text('Gallery'),
                    leading: Icon(Icons.photo_library),
                  ),
                )
              ]
            ),
          ),
        
        );
      }
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,

    child: Scaffold(
       backgroundColor: Color.alphaBlend(Colors.white10, Colors.black38),
    
      body: SingleChildScrollView(
        
        child :Column(
          children:[ 
            
            Container(
              
              height: 300,
              child: Row(


                children: [

                  SizedBox(
                    width: 20,
                  ),
                  
                 Text(
                    'Insert Dogs Traing',
                    style: TextStyle(
                      color: Color(0xffDDA962),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Container(
                  //       height: 240,
                  //       width: 120,
                  //       child: Image.asset('assets/login.png'),
                  //     ),
                      
Stack(
  alignment: AlignmentDirectional.bottomCenter,
  children: <Widget>[
   // Night sky image here
    AnimatedContainer(
      duration: Duration(milliseconds: 10),
      height: 150,
      width: 100,
      margin: EdgeInsets.only(bottom: 50),
      child: Image.asset('assets/login.png'),
    ),
    // Launch button here
  ],
)
                 
                ],
              ),
            ),
           
            
            
            
            Padding(
            padding : const EdgeInsets.symmetric(vertical:10,horizontal: 20),
          
          child:Column(children: [
            InkWell(
              
              onTap: (){
              dialog(context);
              },
              child:Center (
                child: _image != null ? ClipRRect(
                  child: Image.file(
                    _image!.absolute,
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                 
                ):Container(
                    decoration: BoxDecoration(
                      color: Color(0xffDDA962),
                      borderRadius: BorderRadius.circular(15)),
                      width: 400,
                      height: 80,
                      child: Icon(Icons.camera_alt, color: Colors.grey[800], size: 50,),
                  ),
              ),
            ),
        
            SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                 controller: nameController,
                  maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                   ),
                decoration: InputDecoration(
                  filled: true,
                   fillColor: Color(0xffDDA962),     
                   hintStyle: (
                        TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                  hintText: 'Insert Dogs Name',
                 
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xffDDA962), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xffDDA962), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xffDDA962), width: 2),
                      ),
                ),
              ),
        
             SizedBox(
                height: 30,
              ),

            
              TextFormField(
              
                keyboardType: TextInputType.text,
                 controller: tainingDetailsController,
                  maxLines: 1,
                 style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                   ),
                 
                decoration: InputDecoration(
                  filled: true,
                   fillColor: Color(0xffDDA962),     
                   hintStyle: (
                        TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                  hintText: 'Insert Dog Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xffDDA962), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xffDDA962), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xffDDA962), width: 2),
                      ),
                ),
              ),
        
        
               SizedBox(
                 height: 30,
                ),
            
               TextFormField(
                   keyboardType: TextInputType.text,
                   controller: tainingcatgoryController,
                    maxLines: 1,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                   ),
                   decoration: InputDecoration(
                   filled: true,
                   fillColor: Color(0xffDDA962),     
                   hintStyle: (
                        TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                   
                  hintText: 'Insert Dog Catgory',
                
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                   disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xffDDA962), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xffDDA962), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xffDDA962), width: 2),
                      ),
                ),
                
        
               
              ),
              SizedBox(
                height: 30,
              ),
               RoundButton(title: 'Submit', loading: loading,
                      
                      onTap: () async{
              
                      setState(() {
                        loading = true;
                      });
                  
                    int date = DateTime.now().millisecondsSinceEpoch;
                    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/dog_images/'+DateTime.now().millisecondsSinceEpoch.toString());
                    firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);
                   
                    await Future.value(uploadTask).then((value)async{
                     
                      var downloadURL = await (await uploadTask).ref.getDownloadURL();
              
                   
                    final User? user = _auth.currentUser;
                    String id  = DateTime.now().millisecondsSinceEpoch.toString() ;
                    databaseRef.child(id)
                  
                        .set({
                           'name': nameController.text.toString(),
                          'age':tainingDetailsController.text.toString(),
                           'catagory':tainingcatgoryController.text.toString(),
                           'image':downloadURL.toString(),
                            'uid':user!.uid.toString(),
                           'uEmail':user.email.toString(),
                           'id' : id
                        });
                   
                   
        
        
                    }).then((value) {
                      
                      toastMessage ('Dog Added Successfully');
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LandingPage()));
                      setState(() {
                        loading = false;
                      });
                      
                      
                      
          
                    }).onError((error, stackTrace) {
                      toastMessage ('Dog Added Failed');
                           setState(() {
                            loading = false ;
                           });
        
                           print(error);
                }).onError((error, stackTrace){
                       Utils().toastMessage(error.toString());
                }); 
                      }
              ),
          ],),
              // ),
              ),
          ]
        ),
    ),
    )
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
