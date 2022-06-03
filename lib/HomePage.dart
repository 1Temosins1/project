import 'package:android_studio_projects/User%20Auth/ULogin.dart';
import 'package:flutter/material.dart';
import 'Employee Auth/login_screen.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body:SingleChildScrollView(
        child: SafeArea(
          child: Container(


            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: Column(


              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(

                      radius: 150,
                      backgroundColor: Colors.white,


                      backgroundImage: AssetImage('assets/Logo.png'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    const Text(
                      "Welcome to Bricks",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF3F51B5),

                        fontSize: 30,

                      ),

                    ),
                    const SizedBox(
                      height: 100,
                    ),


                  ],
                ),
                const SizedBox(
                  height: 10,
                ),


                Column(
                  children: <Widget>[
                    // the login button
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ULogin()));


                      },
                      color: const Color(0xFF3F51B5),

                      // defining the shape
                      shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Text(
                        "Client",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                    ),
                    // creating the signup button
                    const SizedBox(height:20),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreens()));


                      },
                      color: const Color(0xFF3F51B5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Text(
                        "Employee",
                        style: TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                    )

                  ],
                )



              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}