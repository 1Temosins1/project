import 'package:android_studio_projects/shared/componentes/componentes.dart';
import 'package:flutter/material.dart';
class EditUprofile extends StatefulWidget {
  const EditUprofile({Key? key}) : super(key: key);

  @override
  State<EditUprofile> createState() => _EditUprofileState();
}

class _EditUprofileState extends State<EditUprofile> {
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

                  CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage("assets/person.png"),

                  ),

                  Positioned(

                    bottom: 20.0,
                    right: 20.0,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomsheet()),
                        );
                      },
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                        size: 28.0,

                      ),
                    ),

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
                  defaultButton(
                      text: 'Update',
                      background: Colors.blue,
                      function:(){

                      }



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
              FlatButton.icon(
                icon: const Icon(Icons.camera),
                onPressed: () {
                },
                label: const Text("Camera"),
              ),
              FlatButton.icon(
                icon: const Icon(Icons.image),
                onPressed: () {

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