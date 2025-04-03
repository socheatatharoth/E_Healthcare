import 'package:healthcare/Record/record_list.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/mainscreen/newfeed.dart';
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
              width: 114,
              height: 114,
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
            SizedBox(height: 20,),
            Column(
              children: [
                Image.asset(
                  'assets/images/correct.png',
                  width: 110,
                  height: 110,
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              // width: ,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),// desination
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color.fromARGB(255, 34, 96, 255),
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
