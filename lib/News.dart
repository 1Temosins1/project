import 'package:android_studio_projects/comment.dart';
import 'package:android_studio_projects/shared/componentes/componentes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  var id;
  var email;
  void initState() {
    super.initState();
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    email= user?.email;
    id = user?.uid;
    print(id);
    print(email);
  }



  var NewsController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;




  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;

    email= user?.email;


    return  Scaffold(

      body: Container(

        child: StreamBuilder<QuerySnapshot> (

//snapshots()
              stream: FirebaseFirestore.instance.collection("Posts").snapshots(),

              builder: (context, snapshot) {

                if (snapshot.hasData) {
                  return ListView.builder(


                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot doc = snapshot.data!.docs[index];
                        print([index]);

                        return Card(

                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(doc['email']),
                                Text(doc['Posts']),



                              ],
                              ),


                            subtitle: Container(

                              width: 120,
                              height: 50,

                              child: Row(
                                children: [
                                  IconButton(
                                    icon:Icon( Icons.favorite,color: Colors.red,size: 30,) ,
                                    onPressed: () {


                                    },
                                  ),
                                  IconButton(
                                    icon:Icon( Icons.chat_bubble_outline,color: Colors.grey,size: 30,) ,
                                    onPressed: () {
                                      Get.to(comment(),arguments: doc);



                                    },
                                  ),
                                ],
                              ),
                            ),

                          ),

                        );



                      });
                } else {
                  return Text("No data");
                }
              },


            ),
      ),




    );
  }
}