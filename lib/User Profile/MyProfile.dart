// ignore: file_names
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../shared/componentes/componentes.dart';
import 'EditUprofile.dart';
class Myprofile extends StatefulWidget {
  const Myprofile({Key? key}) : super(key: key);
  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  var id;
  var email;
  String ?pic;


  @override
  void initState() {
    super.initState();
      getdata();

    print(id);
    print(email);
  }
  Future<void> getdata() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    email= user?.email;
    id = user?.uid;
  print(id);
    FirebaseFirestore.instance
        .collection('Users')
        .doc(id)
        .snapshots()
        .listen((userData) {

      setState(() {
        pic=userData.data()!['Image'];


        nameController.text = userData.data()!['Name'];
        emailController.text = userData.data()!['email'];
        phoneController.text = userData.data()!['Phone Number'];
        dobController.text =userData.data()!['DOB'];


        print(userData.data()!['Name']);
        print(userData.data()!['Email']);
        print(userData.data()!['Phone Number']);


      });

  });}
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var profissionController = TextEditingController();
  var dobController = TextEditingController();
  var titleController = TextEditingController();
  var aboutController = TextEditingController();
  var formKey= GlobalKey<FormState>();
  bool isPassword=true;

  int selectedValue = 0;
  final picker = ImagePicker();
  File? image;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: SingleChildScrollView(

            child: Form(
              key: formKey,

              child: Column(


                children: [

                  InkWell(

                    onTap: () {

                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomsheet()),
                      );
                    },
                    child:  CircleAvatar (
                      radius: 80.0,

                      child: CircleAvatar(
                        radius: 80.0,
                        backgroundImage:  NetworkImage(pic != null ? '$pic':
                        'banner2.cleanpng.com/20180319/lde/kisspng-india-login-computer-icons-emoticon-medicine-user-login-icon-5ab05c8be74df7.6661394815215074679474.jpg',),
                      ),
                    ),
                    // child: const Icon(
                    //   Icons.camera_alt,
                    //   color: Colors.blue,
                    //   size: 28.0,
                    //
                    // ),


                  ),

              SizedBox(
                    height: 20.0,
                  ),


                  SizedBox(
                    height: 20.0,
                  ),






                  defaultFormField(
                    controller: nameController,
                    label: 'Name',
                    hint: "Hatem Tarek Hatem",

                    prefix: Icons.person,
                    type: TextInputType.name,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Name must not be empty';
                      }
                      return null;
                    },

                  ),





                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    label: 'Email',
                    hint: "bricks@example.com",
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    validate: ( value)
                    {
                      if(value.isEmpty){
                        return 'email must not be empty';
                      }
                      return null;
                    },

                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: phoneController,
                    label: 'Phone Number',
                    hint: "01010101010",

                    prefix: Icons.phone,
                    type: TextInputType.phone,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Phone Number must not be empty';
                      }
                      return null;
                    },

                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    controller: dobController,
                    label: 'Date of Birth',
                    hint: "01/01/2020",

                    prefix: Icons.calendar_today_outlined,
                    type: TextInputType.datetime,
                    validate: ( value)
                    {
                      if(value.isEmpty){
                        return 'Date of birth must not be empty';
                      }
                      return null;
                    },

                  ),

                  SizedBox(
                    height: 15.0,
                  ),



                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      text: 'Update',
                      background: Colors.blue,
                      function: () {
    Map <String,dynamic> data={"email":email,"Name":nameController.text,"Image": pic,"Phone Number":phoneController.text,"DOB":dobController.text};
    FirebaseFirestore.instance.collection("Users").doc(id).update(data).then((value) {
      print("updated");
    });}





                  ),],
              ),
            ),
          ),
        ),


      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 100.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () async{
                  final pickedFile = await picker.pickImage(source: ImageSource.camera);

                  setState(() {
                    image = File(pickedFile!.path);



                    UploadTask uploadTask =   FirebaseStorage.instance.ref().child(image!.path).putFile(image!);

                    uploadTask.whenComplete(() async{

                      try{
                        pic = await  FirebaseStorage.instance.ref().child(image!.path).getDownloadURL();
                      }catch(onError){
                        print("Error");
                      }

                      print(pic);

                    });

                  });

                  // Capture a photo

                },
                label: const Text("Camera"),
              ),
              TextButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () async{
                  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    image = File(pickedFile!.path);



                    UploadTask uploadTask =   FirebaseStorage.instance.ref().child(image!.path).putFile(image!);

                    uploadTask.whenComplete(() async{

                      try{
                        pic = await  FirebaseStorage.instance.ref().child(image!.path).getDownloadURL();
                      }catch(onError){
                        print("Error");
                      }

                      print(pic);

                    });

                  });







                },
                label: const Text("Gallary"),
              ),


            ],
          ),
        ],
      ),
    );


  }

}

