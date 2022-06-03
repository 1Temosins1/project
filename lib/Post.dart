import 'package:android_studio_projects/News.dart';
import 'package:android_studio_projects/User%20Profile/ServicePage.dart';
import 'package:android_studio_projects/shared/componentes/componentes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  var id;
  var email;
  void initState() {
    super.initState();
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    email= user?.email;
    id = user?.uid;
    print(id);
    print(email);
  }



  var PostController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;




  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;

    email= user?.email;


    return  Scaffold(



      appBar: AppBar( backgroundColor: Colors.blue,

        title: const Text(
          "News Feeds",

        ),
        actions:
        [


           TextButton(
                onPressed: (){
                  Map <String,dynamic> data={"Posts":PostController.text,"email":email};
                  FirebaseFirestore.instance.collection("Posts").add(data).then((value){
                    print("Posted");
                    print(email);

                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ServicePage()));


                },
               child:
               Text(
                 "Post",
               style: TextStyle(
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
                 fontSize: 18,

               ),

           )
           )




        ],

      ),

     body: Container(
            height: 800.0,

            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              children: [
                defaultFormField(
                  maxl: 4,
                  controller: PostController,
                  label: 'Whats in your mind',
                  hint: "Description",

                  prefix: Icons.description,
                  validate: (value)
                  {





                  },

                ),
     ],
    ),
     ),




    );
  }
}