import 'package:android_studio_projects/Employees/Carpenter.dart';
import 'package:android_studio_projects/Employees/Electrician.dart';
import 'package:android_studio_projects/Employees/Engineers.dart';
import 'package:android_studio_projects/Employees/Gardener.dart';
import 'package:android_studio_projects/HomePage.dart';
import 'package:android_studio_projects/User%20Auth/ULogin.dart';
import 'package:android_studio_projects/Employees/Worker.dart';
import 'package:android_studio_projects/Employees/plumber.dart';
import 'package:android_studio_projects/User%20Auth/UserCreate.dart';
import 'package:android_studio_projects/shared/componentes/componentes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class USignup extends StatefulWidget {
  const USignup({Key? key}) : super(key: key);

  @override
  State<USignup> createState() => _USignupState();
}

class _USignupState extends State<USignup> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var dobController = TextEditingController();

  var formKey= GlobalKey<FormState>();
  bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
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
                    height: 20.0,
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
                    text: 'Next',
                    background: Colors.blue,
                    function:(){
                      Map <String,dynamic> data={"Email":emailController.text};
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text).then((value){
                        print("Created new account");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => UserCreate()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });

                      if(formKey.currentState!.validate())
                      {
                        print(emailController.text);
                        print(passwordController.text);
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
}



