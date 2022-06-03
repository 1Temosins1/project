import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Employee Profile/EMyprofile.dart';


class Carpenter extends StatefulWidget {
  const Carpenter({Key? key}) : super(key: key);

  @override
  State<Carpenter> createState() => _CarpenterState();
}

class _CarpenterState extends State<Carpenter> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(
          backgroundColor: Colors.blue,

          title: const Text(
            "Carpenter",

          ),
          actions:
          [
            IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {
                print('hello');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.translate,
              ),
              onPressed: () {
                print('hello');
              },
            ),
          ],
        ),
      body:  StreamBuilder<QuerySnapshot>(

        stream: FirebaseFirestore.instance.collection("Carpenter").snapshots(),
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return ListView.builder(


                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  return Card(

                    child: ListTile(
                      title: Text(doc['Name']),
                      subtitle: Text(doc['type']),
                      leading: CircleAvatar(

                        backgroundImage:NetworkImage(doc['Image']!=null?'${doc['Image']}':'https://png2.cleanpng.com/sh/e5b80a89b89ffcbc15cb1b1fc8f970f9/L0KzQYm3U8E6N6h9fZH0aYP2gLBuTflvbJpmRd54Z3nxPbT2jgB2fJZ3Rdtsb372Pbb0jCRqa5DzRd9uZHnmebBsTgV0baMyhNHwaX6webT2jr02aZM1TdUDY0K6dIXqUb41PWo2SKsEOEG4QoK8UMc1Pmk2TqU7LoDxd1==/kisspng-india-login-computer-icons-emoticon-medicine-user-login-icon-5ab05c8c27d4c1.4591099815215074681632.png'),

                      ),
                      trailing: IconButton(
                        icon:Icon( Icons.description) ,
                        onPressed: () {
                          Get.to(EMyprofile(),arguments: doc);



                        },
                      ),
                    ),

                  );



                });
          } else {
            return Text("No data");
          }
        },

      )
      ,

    );
  }
}