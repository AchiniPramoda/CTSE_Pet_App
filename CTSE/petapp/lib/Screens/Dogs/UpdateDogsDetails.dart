import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateDogs extends StatefulWidget {
  const UpdateDogs({Key? key, required this.DogKeys}) : super(key: key);
  
  final String DogKeys;

  @override
  State<UpdateDogs> createState() => _UpdateDogsState();
}

class _UpdateDogsState extends State<UpdateDogs> {

   final nameController = TextEditingController();
   final ageController = TextEditingController();
   final catgoryController = TextEditingController();

   bool loading = false ;
 
  late DatabaseReference dbRef;
 
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Dogs');
    getDogsData();
  }
 
  void getDogsData() async {
    DataSnapshot snapshot = await dbRef.child(widget.DogKeys).get();
 
    Map dog = snapshot.value as Map;
 
    nameController.text = dog['name'];
    ageController.text = dog['age'];
    catgoryController.text = dog['catagory'];
 
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
                    'Insert Dogs Details',
                    style: TextStyle(
                      color: Color(0xffDDA962),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Container(
                        height: 240,
                        width: 160,
                        child: Image.asset('assets/login.png'),
                      ),
                 
                ],
              ),
            ),
           
            
            
            
            Padding(
            padding : const EdgeInsets.symmetric(vertical:10,horizontal: 20),
          
          child:Column(children: [
           
        
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
                 controller: ageController,
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
                   controller: catgoryController,
                     keyboardType: TextInputType.text,
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
               
                MaterialButton(
                      onPressed: () {
           
                        Map<String, String> Dogs = {
                          'name': nameController.text,
                          'age': ageController.text,
                          'catagory': catgoryController.text
                        };
           
                        dbRef.child(widget.DogKeys).update(Dogs)
                        .then((value) => {
                           Navigator.pop(context) 
                        });
           
                      },
                       
                      child: const Text('Updated Data',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                     color: Color(0xff003F36),
                      textColor: Colors.white,
                     
                      elevation: 5,
              
                     padding: EdgeInsets.symmetric(horizontal: 28, vertical: 25),
                    shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(16),
                     side: BorderSide(color: Color(0xff6ED1BA), width: 2),
                 
            
              ),
                      
                      minWidth: 250,
                      height: 38,
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
