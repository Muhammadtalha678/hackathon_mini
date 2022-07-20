// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/profile.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  TextEditingController search = TextEditingController();

  final List<Map> myProducts =
      List.generate(199, (index) => {"id": index, "name": "Product $index"})
          .toList();
  @override
  Widget build(BuildContext context) {
    // final Stream _productsStream =
    //     FirebaseFirestore.instance.collection('Products').snapshots();
    CollectionReference users =
        FirebaseFirestore.instance.collection('Products');
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 115,
              color: Color(0xffffffff),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(top: 10),
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffF8F8F8),
                      ),
                      child: TextField(
                        controller: search,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: GestureDetector(
                            child: Icon(Icons.close),
                            onTap: () {
                              setState(() {
                                search.text = "";
                              });
                            },
                          ),
                          hintText: "Search Here",
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 24,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          // color: Colors.red,
                        ),
                        child: Center(
                          child: Image(
                            image: AssetImage('assets/images/avatar.png'),
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder<QuerySnapshot>(
                future: users.get(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.docs != null) {
                      // Map<String, dynamic> data =
                      //     snapshot.data!.data() as Map<String, dynamic>;
                      final List<DocumentSnapshot> data = snapshot.data.docs;
                      // List<dynamic> list = map.values.toList();

                      return Expanded(
                        child: GridView.builder(
                          itemCount: data.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  //crossAxisSpacing: 4.0,
                                  // mainAxisSpacing: 4.0,
                                  crossAxisCount:
                                      (orientation == Orientation.portrait)
                                          ? 2
                                          : 3),
                          itemBuilder: (BuildContext context, int index) {
                            // ignore: unnecessary_new
                            return Builder(builder: (context) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Card(
                                    // ignore: unnecessary_new
                                    child: Stack(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Positioned.fill(
                                      child: Image(

                                          //  fit: BoxFit.scaleDown,
                                          image: AssetImage(
                                              'assets/images/girl.png')),
                                    ),
                                    Positioned(
                                        top: 100,
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          color: Colors.black12,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 2),
                                            child: Column(
                                              children: [
                                                Row(
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      child: Text(
                                                        data[index]['Price'],
                                                        // '\$ 25.99',
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xffFE2550),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily: 'Raleway',
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 70),
                                                    Icon(
                                                      Icons.favorite_outline,
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Text(data[index]
                                                          ['Description']),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 3,
                                                        left: 10,
                                                      ),
                                                      child: Container(
                                                        height: 25,
                                                        width: 25,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          // color: Colors.red,
                                                        ),
                                                        child: Center(
                                                          child: Image(
                                                            image: AssetImage(
                                                                'assets/images/profile.png'),
                                                            width: 50,
                                                            height: 50,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      data[index]['Shopname'],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: 'Raleway',
                                                        fontSize: 14,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                  ],
                                )),
                              );
                            });
                          },
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                })
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: '', tooltip: 'MainPage'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xffFE2550),
      ),
    );
  }
}
//

// GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 3),
//   itemCount: list.length,
//   padding: EdgeInsets.all(2.0),
//   itemBuilder: (BuildContext context, int index) {
//     return Container(
//       child: GestureDetector(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => SecondScreen(
//                     imageUrl: list[index]["imageUrl"])),
//           );
//         },
//         child: CachedNetworkImage(
//           imageUrl: list[index]["imageUrl"],
//           fit: BoxFit.cover,
//         ),
//       ),
//       padding: EdgeInsets.all(2.0),
//     );
//   },
// );

// ListView.builder(
//                 itemCount: myProducts.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(myProducts[index]['name']),
//                     trailing: SizedBox(
//                       width: 70,
//                       child: Row(
//                         children: [
//                           GestureDetector(
//                             child: Icon(Icons.delete),
//                             onTap: () {
//                               // chatremove(index);
//                             },
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           GestureDetector(
//                             child: Icon(Icons.edit),
//                             onTap: () {
//                               // showAlertDialog(context, index);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
