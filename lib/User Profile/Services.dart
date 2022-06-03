import 'package:flutter/material.dart' ;
import "package:flutter/src/widgets/framework.dart";
import '../Employees/Engineers.dart';
import '../Employees/Engineers.dart';
import '../Employees/Worker.dart';
import '../Employees/Electrician.dart';
import '../Employees/plumber.dart';
import '../Employees/Gardener.dart';
import '../Employees/Carpenter.dart';
import '../Employees/Painter.dart';
class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {

 @override
 Widget build(BuildContext context) {
  return Scaffold(
    body:
     Padding(
      padding: const EdgeInsets.all(1.0),


      child: SingleChildScrollView(

        child: Padding(
         padding: const EdgeInsets.all(1.0),
         child: Column(
          children: <Widget>[
           // CircleAvatar(
           //
           //  radius: 150,
           //
           //
           //  backgroundImage: AssetImage('assets/loc1.jpg'),
           // ),
           // const SizedBox(
           //  height: 40,
           // ),
           //
           //
           //
           //
           //
           //
           // Text("About",
           //     textAlign: TextAlign.center,
           //     style: TextStyle(
           //      fontWeight: FontWeight.bold,
           //      color: Colors.blue,
           //      fontSize: 25,
           //
           //     )),
           // const SizedBox(
           //  height: 10,
           // ),
           // Text("Bricks were one of the first applications to specialize in designing and constructing new sites or existing projects. "
           //     "The user will no longer waste time looking for real estate offices or engineers."
           //     " Bricks has added to its achievements some of the modern and innovative buildings designed in various cities."
           //     " We provide contracting services. We have been licensed to work in all parts Egypt."
           //     " We believe in using updated technologies and ensure safety when designing venture plans.  ",
           //  textAlign: TextAlign.center,
           //  style: TextStyle(
           //   color: Colors.grey,
           //   fontSize: 20,
           //
           //  ),
           // ),
           //
           // const SizedBox(
           //  height: 10,
           // ),

           Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(

             child: Stack(
              alignment: Alignment.bottomCenter,
              children:
              [
                Image(
                image: AssetImage(
                    'assets/Engineers.jpg'),
               ),
               Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(
                 vertical: 5.0,
                ),
                child: const Text(
                 'Engineers',
                 textAlign: TextAlign.center,

                 style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                 ),
                ),
               ),

              ],
             ),
             clipBehavior: Clip.antiAliasWithSaveLayer,
             minWidth: double.infinity,
             height: 100.0,
             onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Engineers()));
             },


            ),
           ),

           Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(

             child: Stack(
              alignment: Alignment.bottomCenter,
              children:
              [
               Image(
                image: AssetImage(
                    'assets/Workers.png'),
               ),
               Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(
                 vertical: 5.0,
                ),
                child: const Text(
                 'Workers',
                 textAlign: TextAlign.center,

                 style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                 ),
                ),
               ),

              ],
             ),
             clipBehavior: Clip.antiAliasWithSaveLayer,
             minWidth: double.infinity,
             height: 100.0,
             onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Worker()));
             },


            ),
           ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(

             child: Stack(
              alignment: Alignment.bottomCenter,
              children:
              [
               Image(
                image: AssetImage(
                    'assets/Electirician.jpg'),
               ),
               Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(
                 vertical: 5.0,
                ),
                child: const Text(
                 'Electrician',
                 textAlign: TextAlign.center,

                 style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                 ),
                ),
               ),

              ],
             ),
             clipBehavior: Clip.antiAliasWithSaveLayer,
             minWidth: double.infinity,
             height: 100.0,
             onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Electrician()));
             },


            ),
           ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(

             child: Stack(
              alignment: Alignment.bottomCenter,
              children:
              [
               Image(
                image: AssetImage(
                    'assets/Plumber.jpeg'),
               ),
               Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(
                 vertical: 5.0,
                ),
                child: const Text(
                 'plumber',
                 textAlign: TextAlign.center,

                 style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                 ),
                ),
               ),

              ],
             ),
             clipBehavior: Clip.antiAliasWithSaveLayer,
             minWidth: double.infinity,
             height: 100.0,
             onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => plumber()));
             },


            ),
           ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(

             child: Stack(
              alignment: Alignment.bottomCenter,
              children:
              [
               Image(
                image: AssetImage(
                    'assets/Gardener.jpg'),
               ),
               Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(
                 vertical: 5.0,
                ),
                child: const Text(
                 'Gardener',
                 textAlign: TextAlign.center,

                 style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                 ),
                ),
               ),

              ],
             ),
             clipBehavior: Clip.antiAliasWithSaveLayer,
             minWidth: double.infinity,
             height: 100.0,
             onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Gardener()));
             },


            ),
           ),

           Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(

             child: Stack(
              alignment: Alignment.bottomCenter,
              children:
              [
               Image(
                image: AssetImage(
                    'assets/Carpenter.jpg'),
               ),
               Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(
                 vertical: 5.0,
                ),
                child: const Text(
                 'Carpenter',
                 textAlign: TextAlign.center,

                 style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                 ),
                ),
               ),

              ],
             ),
             clipBehavior: Clip.antiAliasWithSaveLayer,
             minWidth: double.infinity,
             height: 100.0,
             onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Carpenter()));
             },


            ),
           ),

           Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(

             child: Stack(
              alignment: Alignment.bottomCenter,
              children:
              [
               Image(
                image: AssetImage(
                    'assets/Painter.jpg'),
               ),
               Container(
                width: double.infinity,
                color: Colors.black.withOpacity(0.7),
                padding: const EdgeInsets.symmetric(
                 vertical: 5.0,
                ),
                child: const Text(
                 'Painter',
                 textAlign: TextAlign.center,

                 style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                 ),
                ),
               ),

              ],
             ),
             clipBehavior: Clip.antiAliasWithSaveLayer,
             minWidth: double.infinity,
             height: 100.0,
             onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Painter()));
             },


            ),
           ),


          ],
         ),
  ),
  ),
     ),
  );






 }
}
