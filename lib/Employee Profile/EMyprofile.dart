import 'package:android_studio_projects/Employee%20Profile/Jobs.dart';
import 'package:android_studio_projects/shared/componentes/componentes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';





class EMyprofile extends StatefulWidget {
  const EMyprofile({Key? key}) : super(key: key);


  @override
  State<EMyprofile> createState() => _EMyprofileState();
}

class _EMyprofileState extends State<EMyprofile> {
  var id;
  var data =Get.arguments;

  void initState() {
    super.initState();
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    email= user?.email;
    id = user?.uid;
    print(id);
    print(email);
  }


  var email;
  var Email;

  @override



  var RequestController = TextEditingController();
  //
  // var formKey= GlobalKey<FormState>();
  //   List<TextModel> mommd = [
  //  TextModel()
  // ];
  var formKey= GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;


  @override

  Widget build(BuildContext context) {
    final User? user = auth.currentUser;

    email= user?.email;

    Email='${data['email']}';
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: SingleChildScrollView(

              child: Form(
                key: formKey,

                child: Column(


                  children: [

                    CircleAvatar(
                      radius: 80.0,
                      backgroundImage:  NetworkImage(data['Image']!=null?'${data['Image']}':'https://png2.cleanpng.com/sh/e5b80a89b89ffcbc15cb1b1fc8f970f9/L0KzQYm3U8E6N6h9fZH0aYP2gLBuTflvbJpmRd54Z3nxPbT2jgB2fJZ3Rdtsb372Pbb0jCRqa5DzRd9uZHnmebBsTgV0baMyhNHwaX6webT2jr02aZM1TdUDY0K6dIXqUb41PWo2SKsEOEG4QoK8UMc1Pmk2TqU7LoDxd1==/kisspng-india-login-computer-icons-emoticon-medicine-user-login-icon-5ab05c8c27d4c1.4591099815215074681632.png'),

                    ),
                    SizedBox(
                      height: 50.0,
                    ),

                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration:   BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10,left: 10),
                        child: Text(
                          '${data['Name']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration:   BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10,left: 10),
                        child: Text(
                          '${data['email']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration:   BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10,left: 10),
                        child: Text(
                          '${data['type']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration:   BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10,left: 10),
                        child: Text(
                          '${data['About']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                        text: 'Request',
                        background: Colors.blue,
                        function:() {
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomsheet()),
                          );


                        })],
                ),
              ),
            ),
          ),

        ),


      ),
    );


    // final firebaseUser=await FirebaseAuth.instance.currentUser!;
    // if(firebaseUser!=null)
    //   await FirebaseFirestore.instance.collection("Employees")..doc("Carpenter").collection("Carpenter+data")
    //     .get().then((ds){
    //     mommd;
    // },);



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
              controller: RequestController,
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
                    Map <String,dynamic> data={"Request":RequestController.text,"email":Email,"status":false,"uemail":email,"phone":""};
                    FirebaseFirestore.instance.collection("Request").add(data).then((value){
                      print("Request was sent");
                      print(email);

                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });

                  },
                  text: "Request"),
            )



          ],
        ),
      ),
    );


  }


  }


//
// Widget textbuilder(TextModel model)=>Text(
//   '${model.name}',
//   style: const TextStyle(fontSize: 24,color: Colors.black),
// );
//
// class TextModel {
//   var name;
// }








