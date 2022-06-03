import 'dart:io';
import 'package:android_studio_projects/shared/componentes/componentes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Eeditprofile extends StatefulWidget {
  const Eeditprofile({Key? key}) : super(key: key);

  @override
  State<Eeditprofile> createState() => _EeditprofileState();
}

class _EeditprofileState extends State<Eeditprofile> {
  var id;
  var email;
  String ?pic;

  var type;

  @override
  void initState() {
    super.initState();
    getdata();

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
    fire.collection("Electrician").doc(id).snapshots()
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
    fire.collection("Plumber").doc(id).snapshots()
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
    fire.collection("Gardener").doc(id).snapshots()
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
    fire.collection("Carpenter").doc(id).snapshots()
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
    fire.collection("Painter").doc(id).snapshots()
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
  }
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var profissionController = TextEditingController();
  var dobController = TextEditingController();
  var titleController = TextEditingController();
  var aboutController = TextEditingController();
  var formKey= GlobalKey<FormState>();
  String? value;
  bool isPassword=true;
  final items = ['Engineer','Worker','Electrician','Carpenter','Plumber','Gardener','Painter'];
  final picker = ImagePicker();
  File? image;






  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body:Padding(
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
                    height: 20.0,
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
                    maxl: 5,
                    controller: aboutController,
                    label: 'About',
                    hint: "Description",

                    prefix: Icons.description,
                    type: TextInputType.name,
                    validate: ( value)
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
                  defaultButton(
                      text: 'Update',
                      background: Colors.blue,
                      function:() {



                        Map <String, dynamic> data = {

                          "Image": pic,
                          "email": email,
                          "Name": nameController.text,
                          "Phone Number": phoneController.text,
                          "DOB": dobController.text,
                          "About": aboutController.text
                        };
                        // FirebaseFirestore.instance.collection("Employees").add(data);


                        FirebaseFirestore.instance.collection("Worker").doc(id).update(data).then((value) {
    print("updated");
    });
    FirebaseFirestore.instance.collection("Engineer").doc(id).update(data).then((value) {
                          print("updated");
                        });
                        FirebaseFirestore.instance.collection("Carpenter").doc(id).update(data).then((value) {
                          print("updated");
                        });
                        FirebaseFirestore.instance.collection("Painter").doc(id).update(data).then((value) {
                          print("updated");
                        });
                        FirebaseFirestore.instance.collection("Plumber").doc(id).update(data).then((value) {
                          print("updated");
                        });FirebaseFirestore.instance.collection("Electrician").doc(id).update(data).then((value) {
                          print("updated");
                        });
                        FirebaseFirestore.instance.collection("Gardeneer").doc(id).update(data).then((value) {
                          print("updated");
                        });





                      }


    )],
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
                onPressed: () async {
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
                onPressed: () async{final pickedFile = await picker.pickImage(source: ImageSource.gallery);
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
                label: const Text("Gallary"),
              ),


            ],
          ),
        ],
      ),
    );


  }
}