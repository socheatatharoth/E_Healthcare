import 'package:flutter/material.dart';
import 'Record/record_password.dart';
import 'mainscreen/newfeed.dart';
import 'RegisterAccount/singup.dart';
import 'ForgetPassword/forget_password.dart';
import 'StartApp/GetStart.dart';
import 'mainscreen/newfeed.dart';
import 'RegisterAccount/singup.dart';
import 'ForgetPassword/forget_password.dart';
import 'StartApp/GetStart.dart';
import 'RegisterAccount/signup_done.dart';
import 'Appointment/appointment_screen.dart';
import 'ForgetPassword/new_password.dart';

void main() {
  // runApp(const MyApp());
  // runApp(const RegisterScreen());
  runApp(const ForgetPassword());
  // runApp(const NewPassword());
  // runApp(const GetStart());
  // runApp(const RecordOTP());
  // runApp(const AppointmentScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(103, 58, 183, 1),
        ),
        fontFamily: "Lato",
        useMaterial3: true,
      ),
      // home: const Infocontact(contactName: "IW"), // Fix: Pass a contact name
      // home: BookingPage(),
      home:  GetStart(), 
    );
  }
}
