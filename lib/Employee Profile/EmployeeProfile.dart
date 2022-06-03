import 'package:android_studio_projects/Employee%20Profile/Eeditprofile.dart';
import 'package:android_studio_projects/HomePage.dart';
import 'package:android_studio_projects/Employee%20Auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'EMyprofile.dart';
import 'Jobs.dart';
class EmployeeProfile extends StatefulWidget {
  const EmployeeProfile({Key? key}) : super(key: key);

  @override
  State<EmployeeProfile> createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  int currentIndex=0;
  List<Widget> screens=
  [
    const Jobs(),
    const Eeditprofile(),
  ];
  List<String> titles=
  [
    'Jobs',
    'My Portfolio',

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading:
          IconButton(
            icon: const Icon(
              Icons.logout,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value){
                print("signout");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              });
            },
          ),
          title:  Text(
            titles[currentIndex],
          ),
          actions:
          [
            IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {




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
        body:screens[currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap:(index)
          {
            setState(() {
              currentIndex = index;
            });

          },

          items:
          const [
            BottomNavigationBarItem(
              icon:Icon(
                Icons.list_alt,
              ),
              label:'Jobs',

            ),
            BottomNavigationBarItem(

              icon:Icon(
                Icons.work,
              ),
              label:'My Profile',

            ),


          ],

        ) ,

      ),
    );
  }
}