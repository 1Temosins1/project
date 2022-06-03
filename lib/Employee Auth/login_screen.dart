import 'package:android_studio_projects/CreateProfile.dart';
import 'package:android_studio_projects/Employee%20Profile/EmployeeProfile.dart';
import 'package:android_studio_projects/Employee%20Auth/SignupPage.dart';
import 'package:android_studio_projects/shared/componentes/componentes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../User Profile/ServicePage.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({Key? key}) : super(key: key);

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  var id;
  var type;

  Future<void> getdata() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    id = user?.uid;
    print(id);
    FirebaseFirestore.instance.collection("Users").doc(id).snapshots()
        .listen((userData) {

      setState(() {

        type=userData.data()!['type'];

        print(type);



      });

    });}

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey= GlobalKey<FormState>();
  bool isPassword=true;
  final FirebaseAuth auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    id = user?.uid;
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
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Login now to your jobs',
                        style:Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                      controller: emailController,
                      label: 'Email',
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
                    controller: passwordController,
                    label: 'Password',
                    prefix: Icons.lock,
                    suffix: isPassword ? Icons.visibility_off : Icons.visibility,
                    isPassword: isPassword ,
                    suffixPressed: (){
                      setState(() {
                        isPassword=!isPassword;
                      });

                    },
                    type: TextInputType.visiblePassword,
                    validate: ( value)
                    {
                      if(value.isEmpty){
                        return 'Password must not be empty';
                      }
                      return null;
                    },

                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  defaultButton(
                      text: 'login',
                      background: Colors.blue,
                      function:()async {


                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text).then((value)  {

                              Get.to(() =>EmployeeProfile());





                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });

                        if(formKey.currentState!.validate())
                          {
                            print(emailController.text);
                            print(passwordController.text);
                          }


                        },

                  ),
                  SizedBox(
                    height: 10.0,
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
                        onPressed: () {
                            Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => SignupPage()));

                                            if(formKey.currentState!.validate())
                                              {
                                                  print(emailController.text);
                                                    print(passwordController.text);
                                                   }

                                                },

                        child: Text(
                          'SignUp',
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
}
