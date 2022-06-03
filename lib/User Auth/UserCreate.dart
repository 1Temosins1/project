import 'dart:io';

import 'package:android_studio_projects/User%20Auth/ULogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../shared/componentes/componentes.dart';


class UserCreate extends StatefulWidget {



  @override
  State<UserCreate> createState() => _UserCreateState();
}


class _UserCreateState extends State<UserCreate> {
  var id;
  var email;
  String ?pic;

  @override
  void initState() {
    super.initState();
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    email= user?.email;
    id = user?.uid;
    print(id);
    print(email);
  }

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var dobController = TextEditingController();
  var titleController = TextEditingController();
  var aboutController = TextEditingController();

  final picker = ImagePicker();
  File? image;

  var formKey= GlobalKey<FormState>();
  bool isPassword=true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SignUp',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 40.0,
                  ),
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
                    height: 40.0,
                  ),

                  defaultFormField(
                    controller: nameController,
                    label: 'Name',
                    hint: "Hatem Tarek Hatem",

                    prefix: Icons.person,
                    type: TextInputType.name,
                    validate: ( value)
                    {
                      if(value.isEmpty){
                        return 'Name must not be empty';
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
                    validate: ( value)
                    {
                      if(value.isEmpty){
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
                    text: 'SignUp',
                    background: Colors.blue,
                    function:(){
                      Map <String,dynamic> data={"type":"User","email":email,"Image":pic,"Name":nameController.text,"Phone Number":phoneController.text,"DOB":dobController.text};
                      FirebaseStorage.instance.ref().child(image!.path).putFile(image!);

                      FirebaseFirestore.instance.collection("Users").doc(id).set(data).then((value){
                        print("Created new account");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ULogin()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });

                      if(formKey.currentState!.validate())
                      {

                        print(phoneController.text);
                        print(dobController.text);

                      }

                    },

                  ),

                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
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