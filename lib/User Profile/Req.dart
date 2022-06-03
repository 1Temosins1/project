import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../shared/componentes/componentes.dart';
class Req extends StatefulWidget {
  const Req({Key? key}) : super(key: key);

  @override
  State<Req> createState() => _ReqState();
}

class _ReqState extends State<Req> {
  var id;
  var data =Get.arguments;

  var email;
  bool status=false;
  @override
  void initState() {
    super.initState();
    getdata();
    getdaata();

    print(id);
    print(email);
  }
  Future<void> getdaata() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore fire=FirebaseFirestore.instance;
    final User? user = auth.currentUser;

    email= user?.email;
    id = user?.uid;
    print(id);
    fire.collection("Users").snapshots()
        .listen((userData) {

      setState(() {







      });

    });}
  Future<void> getdata() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore fire=FirebaseFirestore.instance;
    final User? user = auth.currentUser;

    email= user?.email;
    id = user?.uid;
    print(id);
    fire.collection("Requests").snapshots()
        .listen((userData) {

      setState(() {







      });

    });}
  var RequestController = TextEditingController();




  @override
  Widget build(BuildContext context) {

    return  Scaffold(



      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //
      //   title: const Text(
      //     "Engineers",
      //
      //   ),
      //   actions:
      //   [
      //     IconButton(
      //       icon: const Icon(
      //         Icons.search,
      //       ),
      //       onPressed: () {
      //         print('hello');
      //       },
      //     ),
      //     IconButton(
      //       icon: const Icon(
      //         Icons.translate,
      //       ),
      //       onPressed: () {
      //         print('hello');
      //       },
      //     ),
      //   ],
      // ),

        body: Container(

          child: StreamBuilder<QuerySnapshot> (


//snapshots()
            stream: FirebaseFirestore.instance.collection("Request").snapshots(),

            builder: (context, snapshot) {

              if (snapshot.hasData) {
                return ListView.builder(


                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot doc = snapshot.data!.docs[index];
                          if(email==doc["uemail"]) {
                           if(email!=doc["email"]) {


                              status = doc["status"];
                              print([index]);

                              return Card(

                                child: ListTile(
                                  subtitle: doc["phone"] != null ? Text(
                                      "${doc["phone"]}") : Text(""),
                                  title: Row(
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: status == false
                                              ? Colors.red
                                              : Colors.green, radius: 8),
                                      SizedBox(width: 12,),
                                      Text(doc['Request']),

                                    ],
                                  ),

                                  leading: CircleAvatar(

                                    backgroundImage: AssetImage(
                                        'assets/person.png'),

                                  ),
                                  trailing: Container(

                                      width: 120,
                                      child: doc['status'] == true ? Text(
                                          "Accepted") : Text("rejected")
                                  ),
                                ),

                              );

                          }
                           } return Text("");});
              } else {
                return Text("");
              }
            },

          ),
        )


    );
  }
}