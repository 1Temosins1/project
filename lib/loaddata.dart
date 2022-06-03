// import 'package:android_studio_projects/Route.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'User Profile/ServicePage.dart';
// class LoadData extends StatefulWidget {
//   const LoadData({Key? key}) : super(key: key);
//
//   @override
//   State<LoadData> createState() => _LoadDataState();
// }
//
//
// class _LoadDataState extends State<LoadData> {
//   var id ;
//   String? type;
//   Future<void> getdata() async {
//     final FirebaseAuth auth = FirebaseAuth.instance;
//
//     final User? user = auth.currentUser;
//     id = user?.uid;
//     print(id);
//     FirebaseFirestore.instance.collection("Users").doc(id).snapshots()
//         .listen((userData) {
//
//       setState(() {
//
//         type=userData.data()!['type'];
//
//         print(type);
//
//
//
//       });
//
//     });}
//   void initState() {
//     super.initState();
//    getdata().then((value) async {
//      if(type!=null){
//
//        Navigator.push(context,
//          MaterialPageRoute(builder: (context) => RoutePage(type)));}else{
//        getdata().then((value) =>
//            Navigator.push(context,
//                MaterialPageRoute(builder: (context) => RoutePage(type))));
//      }
//
//    });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.maxFinite,
//       color: Colors.white,
//       child: Center(
//         child: SizedBox(
//           height: 50,
//           width: 50,
//           child: CircularProgressIndicator(
//
//
//             backgroundColor: Colors.blue,
//           ),
//         ),
//       ),
//     );
//   }
// }
