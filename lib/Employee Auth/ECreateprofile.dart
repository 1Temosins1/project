import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../shared/componentes/componentes.dart';
import 'login_screen.dart';


class ECrateprofile extends StatefulWidget {



  @override
  State<ECrateprofile> createState() => _ECrateprofileState();
}


class _ECrateprofileState extends State<ECrateprofile> {

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

  final items = ['Engineer','Worker','Electrician','Carpenter','Gardener','Plumber','Painter'];
  String? value;
  var formKey= GlobalKey<FormState>();
  final picker = ImagePicker();
  File? image;
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Center(
                    child:
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


                    ),

                  ),
                  // child: const Icon(
                  //   Icons.camera_alt,
                  //   color: Colors.blue,
                  //   size: 28.0,
                  //
                  // ),






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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey,width: 2)
                    ),
                    child: Center(

                      child: DropdownButton<String>(
                        value:value,
                        iconSize: 36,
                        icon: Icon(Icons.arrow_drop_down,color: Colors.grey),
                        isExpanded: true,
                        onChanged:(value) => setState(() => this.value = value ),
                        items: items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: 15.0,
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
                    text: 'SignUp',
                    background: Colors.blue,
                    function:(){
                      Map <String,dynamic> data={"type":value.toString(),"Image":pic,"email":email,"Name":nameController.text,"Phone Number":phoneController.text,"DOB":dobController.text,"About":aboutController.text};
                      // FirebaseFirestore.instance.collection("Employees").add(data);
                      FirebaseStorage.instance.ref().child(image!.path).putFile(image!);
                      FirebaseFirestore.instance.collection(value!).doc(id).set(data).then((value){
                        print("Created new account");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginScreens()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });

                      if(formKey.currentState!.validate())
                      {

                        print(phoneController.text);
                        print(dobController.text);
                        print(aboutController.text);
                        print(value);
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
  DropdownMenuItem<String> buildMenuItem(String item)=> DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.grey),

    ),);
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