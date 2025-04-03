import 'package:flutter/material.dart';
import 'package:healthcare/Login/screen1.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'forget_pass_OTP.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: To_ForgetPassword(),
    );
  }
}

class To_ForgetPassword extends StatefulWidget {
  @override
  _To_ForgetPassword createState() => _To_ForgetPassword();
}

class _To_ForgetPassword extends State<To_ForgetPassword> {
  String enteredPin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen1(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Text(
              "Forget Password!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                "We’ll send a code OTP to your phone number /email.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                textAlign:
                    TextAlign
                        .center, // Ensures the text is centered if it spans multiple lines
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    "Email / Phone",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      // fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your Email or phone number",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        // fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w600,
                      ),
                      filled: true, 
                      fillColor: Color(0xD3CADD6FF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: TextStyle(
                      height: 1,
                      fontSize: 16,
                      // fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OTPVerificationScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 34, 96, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    // fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
