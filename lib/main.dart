import 'package:flutter/material.dart';
import 'package:remembermee/pages/addcontact.dart';
import 'package:remembermee/pages/contact.dart';
import 'package:remembermee/pages/home.dart';
import 'package:remembermee/pages/login.dart';
import 'package:remembermee/pages/signin.dart';
import './pages/contact.dart';
import 'package:remembermee/pages/relatives.dart';
import 'package:remembermee/pages/alarm.dart';
import 'package:remembermee/pages/addalarm.dart';
import 'package:remembermee/pages/addcontact.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "remembermee",
      home: Login(),
      routes: {
        'contact': (context) {
          return Contact();
        },
        'homepage': (context) {
          return Home();
        },
        'relatives': (context) {
          return Ralatives();
        },
        'alarm': (context) {
          return Alarm();
        },
        'addalarm': (context) {
          return AddAlarm();
        },
        'addcontact': (context) {
          return AddContact();
        },
        'login': (context) {
          return Login();
        },
        'signin': (context) {
          return Signin();
        },
        //'alarmdetails': (context) {
        //return Alarmdtails();
        //},
      },
    );
  }
}
