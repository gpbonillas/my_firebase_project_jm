import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Firebase CRUD Update';
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(fontSize: 24),
              minimumSize: Size.fromHeight(64),
            ),
          ),
        ),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Update'),
                onPressed: () {
                  final docUser = FirebaseFirestore.instance
                      .collection('users')
                      .doc('my-id');
                  // Update specific fields
                  docUser.set({
                    'name': 'James',
                  });
                  // Update nested fields
                  docUser.update({
                    'city.name': 'Santo Domingo',
                  });
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                child: Text('Delete'),
                onPressed: () {
                  final docUser = FirebaseFirestore.instance
                      .collection('users')
                      .doc('my-id');
                  docUser.delete();
                },
              ),
            ],
          ),
        ),
      );
}
