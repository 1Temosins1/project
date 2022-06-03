import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../shared/componentes/componentes.dart';
class Jobs extends StatefulWidget {
  const Jobs({Key? key}) : super(key: key);

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  var id;
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
  Future<void> getdata() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore fire=FirebaseFirestore.instance;
    final User? user = auth.currentUser;

    email= user?.email;
    id = user?.uid;
    print(id);
    fire.collection("Request").snapshots()
        .listen((userData) {

      setState(() {







      });

    });}
  Future<void> getdaata() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore fire=FirebaseFirestore.instance;
    final User? user = auth.currentUser;





    email= user?.email;
    id = user?.uid;

    print(id);


    fire.collection("Engineer").doc(id).snapshots()
        .listen((userData) {


      setState(() {



        phoneController.text = userData.data()!['Phone Number'];


        print(userData.data()!['Name']);
        print(userData.data()!['email']);
        print(userData.data()!['Phone Number']);
        print(userData.data()!['DOB']);
        print(userData.data()!['About']);



      });

    });
    fire.collection("Worker").doc(id).snapshots()
        .listen((userData) {

      setState(() {

        nameController.text = userData.data()!['Name'];
        emailController.text = userData.data()!['email'];
        phoneController.text = userData.data()!['Phone Number'];
        dobController.text =userData.data()!['DOB'];
        aboutController.text =userData.data()!['About'];


        print(userData.data()!['Name']);
        print(userData.data()!['email']);
        print(userData.data()!['Phone Number']);
        print(userData.data()!['DOB']);
        print(userData.data()!['About']);



      });

    });
    fire.collection("Electrician").doc(id).snapshots()
        .listen((userData) {

      setState(() {

        nameController.text = userData.data()!['Name'];
        emailController.text = userData.data()!['email'];
        phoneController.text = userData.data()!['Phone Number'];
        dobController.text =userData.data()!['DOB'];
        aboutController.text =userData.data()!['About'];


        print(userData.data()!['Name']);
        print(userData.data()!['email']);
        print(userData.data()!['Phone Number']);
        print(userData.data()!['DOB']);
        print(userData.data()!['About']);



      });

    });
    fire.collection("Plumber").doc(id).snapshots()
        .listen((userData) {

      setState(() {

        nameController.text = userData.data()!['Name'];
        emailController.text = userData.data()!['email'];
        phoneController.text = userData.data()!['Phone Number'];
        dobController.text =userData.data()!['DOB'];
        aboutController.text =userData.data()!['About'];


        print(userData.data()!['Name']);
        print(userData.data()!['email']);
        print(userData.data()!['Phone Number']);
        print(userData.data()!['DOB']);
        print(userData.data()!['About']);



      });

    });
    fire.collection("Gardener").doc(id).snapshots()
        .listen((userData) {

      setState(() {

        nameController.text = userData.data()!['Name'];
        emailController.text = userData.data()!['email'];
        phoneController.text = userData.data()!['Phone Number'];
        dobController.text =userData.data()!['DOB'];
        aboutController.text =userData.data()!['About'];


        print(userData.data()!['Name']);
        print(userData.data()!['email']);
        print(userData.data()!['Phone Number']);
        print(userData.data()!['DOB']);
        print(userData.data()!['About']);



      });

    });
    fire.collection("Carpenter").doc(id).snapshots()
        .listen((userData) {

      setState(() {

        nameController.text = userData.data()!['Name'];
        emailController.text = userData.data()!['email'];
        phoneController.text = userData.data()!['Phone Number'];
        dobController.text =userData.data()!['DOB'];
        aboutController.text =userData.data()!['About'];


        print(userData.data()!['Name']);
        print(userData.data()!['email']);
        print(userData.data()!['Phone Number']);
        print(userData.data()!['DOB']);
        print(userData.data()!['About']);



      });

    });
    fire.collection("Painter").doc(id).snapshots()
        .listen((userData) {

      setState(() {

        nameController.text = userData.data()!['Name'];
        emailController.text = userData.data()!['email'];
        phoneController.text = userData.data()!['Phone Number'];
        dobController.text =userData.data()!['DOB'];
        aboutController.text =userData.data()!['About'];


        print(userData.data()!['Name']);
        print(userData.data()!['email']);
        print(userData.data()!['Phone Number']);
        print(userData.data()!['DOB']);
        print(userData.data()!['About']);



      });

    });
  }
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var profissionController = TextEditingController();
  var dobController = TextEditingController();
  var titleController = TextEditingController();
  var aboutController = TextEditingController();
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

        body:
        Container(

            child: StreamBuilder<QuerySnapshot> (


//snapshots()
            stream: FirebaseFirestore.instance.collection("Request").snapshots(),

            builder: (context, snapshot) {

              if (snapshot.hasData) {
                return ListView.builder(


                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                    DocumentSnapshot doc = snapshot.data!.docs[index];
                      if(email==doc["email"]) {
                        status=doc["status"];
                        print([index]);

                        return Card(

                          child: ListTile(
                            title: Row(
                              children: [
                                CircleAvatar(backgroundColor: status==false?  Colors.red: Colors.green,radius: 8),
                                SizedBox(width: 12,),
                                Text(doc['Request']),

                              ],
                            ),

                            leading: CircleAvatar(

                              backgroundImage:AssetImage('assets/person.png'),

                            ),
                            trailing: Container(
                              width: 120,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon:Icon( Icons.check_circle_rounded,color: Colors.green,size: 30,) ,
                                    onPressed: () {
                                    setState(() {

                                      status=true;
                                    });
                                    Map <String, dynamic> data={"status":status,"phone":phoneController.text};
                                    FirebaseFirestore.instance.collection("Request").doc(doc.id).update(data).then((value) {
                                      print("updated");
                                    });

                                    },
                                  ),
                            IconButton(
                              icon:Icon( Icons.cancel,color: Colors.red,size: 30,) ,
                              onPressed: () {
                                setState(() {

                                  status=false;
                                });
                                Map <String, dynamic> data={"status":status,"phone":""};
                                FirebaseFirestore.instance.collection("Request").doc(doc.id).update(data).then((value) {
                                  print("updated");
                                });

                              },
                            ),
                                ],
                              ),
                            ),
                          ),

                        );
                      }return Text("");});
              } else {
                return Text("");
              }
            },

          ),
        )


    );
  }
}