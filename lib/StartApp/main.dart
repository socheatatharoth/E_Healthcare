import 'package:flutter/material.dart';
// import 'package:healthcare/newfeed.dart';
// import './detail.dart';
// import 'package:healthcare/newfeed.dart';
// import 'package:healthcare/appointment.dart';
import '../test.dart';
// import 'appointment.dart';
// import './newfeed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(103, 58, 183, 1),
        ),
        fontFamily: "Lato",
        useMaterial3: true,
      ),
      // home: const Infocontact(contactName: "IW"), // Fix: Pass a contact name
      home: BookingPage(),
    );
  }
}
