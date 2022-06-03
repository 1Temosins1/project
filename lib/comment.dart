import 'package:android_studio_projects/shared/componentes/componentes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class comment extends StatefulWidget {
  const comment({Key? key}) : super(key: key);

  @override
  State<comment> createState() => _commentState();
}

class _commentState extends State<comment> {
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

  var commentController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;


var idd;
var daata;
  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    daata=Get.arguments.id;
    email= user?.email;



    return  SafeArea(
      child: Scaffold(



          appBar: AppBar( backgroundColor: Colors.blue,

            title: const Text(
              "Comment",

            ),
            actions:
            [


              TextButton(
                  onPressed: (){
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomsheet()),
                    );

                  },
                  child:
                  Text(
                    "comment",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,

                    ),

                  )
              )




            ],

          ),

          body: Container(
              child: StreamBuilder<QuerySnapshot> (

                stream: FirebaseFirestore.instance.collection("Posts").doc(daata).collection("comments").snapshots(),

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
                              Text(doc['comments']),



                          ],
                              ),

                          ),
                            );

                            },
                                        );

                                  } else {
                                    return Text("No data");
                                  }
                                },


                              ),
            ),
                          ),











    );
  }
  Widget bottomsheet() {

    return SingleChildScrollView(
      child: Container(
        height: 800.0,

        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            defaultFormField(
              maxl: 5,
              controller: commentController,
              label: 'Request',
              hint: "Description",

              prefix: Icons.description,
              validate: (value)
              {


                if(value.isEmpty){
                  return 'Description must not be empty';
                }
                return null;


              },

            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: defaultButton(
                  function: (){

          Map <String,dynamic> data={"comments":commentController.text,"email":email};
          FirebaseFirestore.instance.collection("Posts").doc(daata).collection("comments").add(data).then((value){
            print("commented");
            print(email);

          }).onError((error, stackTrace) {
            print("Error ${error.toString()}");
          });


                  },
                  text: "Comment"),
            )



          ],
        ),
      ),
    );


  }

}