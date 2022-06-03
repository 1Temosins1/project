import 'package:android_studio_projects/Employee%20Profile/EMyprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class Engineers extends StatefulWidget {
  const Engineers({Key? key}) : super(key: key);

  @override
  State<Engineers> createState() => _EngineersState();
}

class _EngineersState extends State<Engineers> {
  var id;
  var type;
  String ?pic;


  @override

  void initState() {
    super.initState();
    getdata();


  }
  Future<void> getdata() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore fire=FirebaseFirestore.instance;

    final User? user = auth.currentUser;





    id = user?.uid;

    print(id);


    fire.collection("Engineer").doc(id).snapshots()
        .listen((userData) {


      setState(() {

        pic=userData.data()!['Image'];



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
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      appBar: AppBar(
        backgroundColor: Colors.blue,

        title: const Text(
          "Engineers",

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

      body:
      StreamBuilder<QuerySnapshot> (

//snapshots()
        stream: FirebaseFirestore.instance.collection("Engineer").snapshots(),

        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return ListView.builder(


                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  print([index]);

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


    );
  }
}