import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Screens/Dogs/UpdateDogsDetails.dart';

class ViewDogsDetailsForAdmin extends StatefulWidget {
  const ViewDogsDetailsForAdmin({Key? key}) : super(key: key);

  @override
  State<ViewDogsDetailsForAdmin> createState() => _ViewDogsDetailsForAdminState();
}

class _ViewDogsDetailsForAdminState extends State<ViewDogsDetailsForAdmin> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Dogs');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Dogs');
  TextEditingController _searchQueryController = TextEditingController();
  late String _searchQuery;

  @override
  void initState() {
    super.initState();
    _searchQuery = "";
    _searchQueryController.addListener(_onSearchQueryChanged);
  }

  @override
  void dispose() {
    _searchQueryController.removeListener(_onSearchQueryChanged);
    _searchQueryController.dispose();
    super.dispose();
  }

  void _onSearchQueryChanged() {
    setState(() {
      _searchQuery = _searchQueryController.text.toLowerCase();
    });
  }

  Widget listItem({required Map Dogs}) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      height: 190,
      decoration: BoxDecoration(
        color: Color(0xffDDA962),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          topLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 200,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Row(

                        children:[ 

                          Text(
                           "Name :  ",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                          Text(
                          Dogs['name'],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        ]
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                     Row(
                       children: [
                          Text(
                            "Details    :  ",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        Text(
                          Dogs['details'],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                       ]
                     ),

                     const SizedBox(
                        height: 8,
                      ),

                       Row(
                       children: [
                          Text(
                            "Catagory  :  ",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        Text(
                          Dogs['catagory'],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                       ]
                     ),



                    ]),
              ),
              Container(
                   alignment: Alignment.centerRight,
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white, width: 2),
                                  // borderRadius: BorderRadius.circular(60),
                                ),
                   
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/placeholder.jpg',
                                  placeholderScale: 1,
                                  image: Dogs['image'],
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                  fadeOutCurve: Curves.easeIn,
                                  
                                  fadeInCurve: Curves.easeIn,
                                  ),
            ),
            ],
          ),
           Container(
                 alignment: Alignment.centerRight,
                   margin: const EdgeInsets.only(right: 20),
                  // padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateDogs(DogKeys: Dogs['key'])));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_outlined,
                             color: Colors.lightGreen, 
                             size: 37
                          ),
                        ],
                          
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    GestureDetector(
                      onTap: () {
                        reference.child(Dogs['key']).remove();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline, 
                            color: Color(0xffDFBAB1), 
                            size:40,
                          ),
                        ],
                      ),     
                    ),
        ],

      ),
    ),
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              child: TextFormField(
                
                controller: _searchQueryController,
                style: TextStyle(
                 color: Colors.black,
                                
                                ),
                decoration: InputDecoration(
                  
                  hintText: 'Search by name',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.white,  
                  prefixIcon: Icon(Icons.search,
                   color: Color.fromARGB(255, 1, 11, 9)
                  ),
                  
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
            ),
          ),

         SizedBox(
            height: 20,
         ),

          Expanded(
            child: FirebaseAnimatedList(
              query: dbRef,
              defaultChild: Text(
                'Loading... Please wait..!!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map Dogs = snapshot.value as Map;
                Dogs['key'] = snapshot.key;
                if (_searchQuery.isNotEmpty) {
                  if (!Dogs['name']
                      .toString()
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase())) {
                    return SizedBox.shrink();
                  }
                }
                return listItem(Dogs: Dogs);
              },
            ),
          ),
        ],
      ),
    );
  }
}
