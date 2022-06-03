import 'package:android_studio_projects/Employees/Engineers.dart';
import 'package:android_studio_projects/Post.dart';
import 'package:android_studio_projects/User%20Profile/MyProfile.dart';
import 'package:android_studio_projects/User%20Profile/Req.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../HomePage.dart';
import '../News.dart';
import 'MyProfile.dart';
import 'Services.dart';
class ServicePage extends StatefulWidget
{


@override
_ServicePage createState() => _ServicePage();
}
class _ServicePage extends State<ServicePage>
{
  int currentIndex=0;
  List<Widget> screens=
      [
        const Services(),
        const News(),
        const Req(),
        const Myprofile(),

      ];
  List<String> titles=
  [
    'Services',
    'News',
    "Requests",
  'My Profile',

  ];
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
           backgroundColor: Colors.blue,
           leading: IconButton(
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

           title: Text(
             titles[currentIndex],

        ),
           actions:
           [

             IconButton(
               icon: const Icon(
                 Icons.post_add,
               ),
               onPressed:() {
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => Post()));

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
                   Icons.miscellaneous_services_outlined,
                 ),
                 label:'Services',

             ),
             BottomNavigationBarItem(
               icon:Icon(
                 Icons.local_post_office_sharp,
               ),
               label:'News',

             ),
             BottomNavigationBarItem(
               icon:Icon(
                 Icons.request_page,
               ),
               label:'Requests',

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