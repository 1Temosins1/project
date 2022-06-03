import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Createprofile extends StatefulWidget {
  const Createprofile({Key? key}) : super(key: key);

  @override
  State<Createprofile> createState() => _Createprofile();
}

class _Createprofile extends State<Createprofile> {


  int selectedValue = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,

        title: const Text(

          "Create New Profile",

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(

          child: ListView(
            children: <Widget>[
              imageProfile(),
              const SizedBox(
                height: 20,
              ),
              nameTextField(),
              const SizedBox(
                height: 20,
              ),
              EmailInputElement(),
              const SizedBox(
                height: 20,
              ),
              PasswordCredentialTextField(),
              const SizedBox(
                height: 20,
              ),
              ConfirmPasswordTextField(),
              const SizedBox(
                height: 20,
              ),


              professionTextField(),
              const SizedBox(
                height: 20,
              ),
              dobField(),
              const SizedBox(
                height: 20,
              ),
              titleTextField(),
              const SizedBox(
                height: 20,
              ),
              phonenumTextField(),
              const SizedBox(
                height: 20,
              ),
              aboutTextField(),
              const SizedBox(
                height: 20,
              ),
              RadioListTile<int>(
                value: 0,
                groupValue: selectedValue,
                title: Text("Engineer"),
                onChanged: (value) => setState(() => selectedValue = value!),
              ),
              RadioListTile<int>(
                value: 1,
                groupValue: selectedValue,
                title: Text("Worker"),
                onChanged: (value) => setState(() => selectedValue = value!),
              ),
              RadioListTile<int>(
                value: 2,
                groupValue: selectedValue,
                title: Text("Electrician"),
                onChanged: (value) => setState(() => selectedValue = value!),
              ),
              RadioListTile<int>(
                value: 3,
                groupValue: selectedValue,
                title: Text("Gardener"),
                onChanged: (value) => setState(() => selectedValue = value!),
              ),
              RadioListTile<int>(
                value: 4,
                groupValue: selectedValue,
                title: Text("Carpenter"),
                onChanged: (value) => setState(() => selectedValue = value!),
              ),
              RadioListTile<int>(
                value: 5,
                groupValue: selectedValue,
                title: Text("Painter"),
                onChanged: (value) => setState(() => selectedValue = value!),
              ),
              RadioListTile<int>(
                value: 6,
                groupValue: selectedValue,
                title: Text("Plumber"),
                onChanged: (value) => setState(() => selectedValue = value!),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {


                },
                color: const Color(0xff0095FF),

                // defining the shape
                shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(50)
                ),
                child: const Text(
                  "Create Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                  ),
                ),
              ),
              // creating the signup button
              const SizedBox(height: 20),


            ],
          ),
        ),

      ),
    );

  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
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

        ],
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



  Widget nameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),

        prefixIcon: Icon(
          Icons.person,
          color: Colors.blue,

        ),
        labelText: "Name",
        helperText: "Name can't be empty",
        hintText: "Dev Stack",
      ),

    );
  }

  Widget EmailInputElement() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),

        prefixIcon: Icon(
          Icons.email,
          color: Colors.blue,

        ),
        labelText: "Email",
        helperText: "Email can't be empty",
        hintText: "bricks@example.com",
      ),

    );
  }

  Widget phonenumTextField() {
    return TextFormField(

      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),

        prefixIcon: Icon(
          Icons.phone,
          color: Colors.blue,

        ),
        labelText: "Phone Number",
        helperText: "It can't be empty",
        hintText: "01010101010",
      ),

    );
  }


  Widget PasswordCredentialTextField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),

        prefixIcon: Icon(
          Icons.lock,
          color: Colors.blue,

        ),
        labelText: "Password",
        helperText: "Password can't be empty",
        hintText: "Password",
      ),

    );
  }

  Widget ConfirmPasswordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),

        prefixIcon: Icon(
          Icons.lock,
          color: Colors.blue,

        ),
        labelText: "Confirm Password",
        helperText: "Password can't be empty",
        hintText: "Confirm Password",
      ),

    );
  }

  Widget professionTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),

        prefixIcon: Icon(
          Icons.person,
          color: Colors.blue,

        ),
        labelText: "Profession",
        helperText: "Profession can't be empty",
        hintText: "Engineer,worker,etc",
      ),

    );
  }

  Widget dobField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),

        prefixIcon: Icon(
          Icons.calendar_today_outlined,
          color: Colors.blue,

        ),
        labelText: "Date of Birth",
        helperText: "Provide DOB on dd/mm/yyyy",
        hintText: "01/01/2020",
      ),

    );
  }

  Widget titleTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),

        prefixIcon: Icon(
          Icons.title,
          color: Colors.blue,

        ),
        labelText: "Title",
        helperText: "It can't be emty",
        hintText: "Company name",
      ),

    );
  }


  Widget aboutTextField() {
    return TextFormField(
      maxLines: 5,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),


        labelText: "About",
        helperText: "It can't be empty",
        hintText: "Description",
      ),

    );
  }



}
