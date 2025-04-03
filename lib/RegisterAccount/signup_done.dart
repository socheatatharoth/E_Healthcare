import 'package:healthcare/Record/record_list.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class SignupDone extends StatelessWidget {
  const SignupDone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PassSignup());
  }
}

class PassSignup extends StatefulWidget {
  const PassSignup({super.key});

  @override
  To_SignupDoneState createState() => To_SignupDoneState();
}

class To_SignupDoneState extends State<PassSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/E-HealthCare_logo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "You Create Account Successfully",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  // fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black,
                ),
                textAlign:TextAlign.center, // Ensures the text is centered if it spans multiple lines
              ),
            ),

            Column(
              children: [
                Image.asset(
                  'assets/images/correct.png',
                  width: 123,
                  height: 123,
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              // width: ,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ToRecordList()),// desination
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    // fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
