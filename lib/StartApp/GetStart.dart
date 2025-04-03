import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/Login/screen1.dart';
import 'package:healthcare/RegisterAccount/singup.dart';


class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Let_GetStart());
  }
}

class Let_GetStart extends StatefulWidget {
  const Let_GetStart({super.key});

  @override
  To_SignupDoneState createState() => To_SignupDoneState();
}

class To_SignupDoneState extends State<Let_GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Image.asset(
                'assets/images/E-HealthCare_logo.png',
                width: 116,
                height: 116,
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "E-Healthcare",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    // fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.blue,
                  ),
                  textAlign:
                      TextAlign
                          .center, // Ensures the text is centered if it spans multiple lines
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Text(
                  "Digital Hospital",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    // fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                  textAlign:
                      TextAlign
                          .center, // Ensures the text is centered if it spans multiple lines
                ),
              ),
              SizedBox(height: 25),
              Center(
                child: Text(
                  "Access reliable health information, track your well-being, and connect with healthcare services—all in one app. Stay informed, stay healthy!",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                    // fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                  textAlign:
                      TextAlign
                          .center, // Ensures the text is centered if it spans multiple lines
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Screen1()),// desination
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 34, 96, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      // fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),// desination
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      // fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Color.fromARGB(255, 34, 96, 255),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Image.asset('assets/images/GetStart_image.png', width: 123, height: 123),
              Container(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => RecodList()),// desination
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 86, 118, 198),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
