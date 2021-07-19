import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Crud',
      home: const MyHomePage(title: 'Firestore CRUD'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final _CollectionReference =
      _firestore.collection("Users").doc("UsersInfo").collection("Profile");
  static final _DocumentReference = _CollectionReference.doc("ProfileInfo");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () => addData(), child: Text("Add Data")),
            TextButton(onPressed: () => readData(), child: Text("Read Data")),
            TextButton(
                onPressed: () => updateData(), child: Text("Update Data")),
            TextButton(
                onPressed: () => deleteData(), child: Text("Delete Data")),
          ],
        ),
      ),
    );
  }

  addData() async {
    Map<String, dynamic> demoData = {
      "Name": "Alok",
      "Email": "manavsuryalok@gmail.com"
    };
    //we use the set method
    _DocumentReference.set(demoData)
        .whenComplete(() => Fluttertoast.showToast(msg: "User Added"))
        .onError((error, stackTrace) =>
            Fluttertoast.showToast(msg: error.toString()));
  }

  readData() async {
    var documentSnapshot = await _CollectionReference.doc("ProfileInfo").get();
    if (documentSnapshot.exists) {
      Map<String, dynamic>? fetchedData = documentSnapshot.data();
      //now we can access any data stored in the fetchedData variable like below
      Fluttertoast.showToast(msg: fetchedData?['Name']);
    }
  }

  updateData() async {
    Map<String, dynamic> demoData = {
      "Name": "Alok Manav",
    };
    //we use the update method
    _DocumentReference.update(demoData)
        .whenComplete(() => Fluttertoast.showToast(msg: "User Updated"))
        .onError((error, stackTrace) =>
            Fluttertoast.showToast(msg: error.toString()));
  }

  deleteData() async {
    _DocumentReference.delete()
        .whenComplete(() => Fluttertoast.showToast(msg: "User Deleted"))
        .onError((error, stackTrace) =>
            Fluttertoast.showToast(msg: error.toString()));
  }
}
