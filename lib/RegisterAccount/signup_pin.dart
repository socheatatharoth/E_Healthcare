import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/RegisterAccount/signup_done.dart';
import 'package:healthcare/RegisterAccount/singup.dart';

class SignupOTP extends StatelessWidget {
  const SignupOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PassSignup());
  }
}

class PassSignup extends StatefulWidget {
  @override
  _To_SignupOTPState createState() => _To_SignupOTPState();
}

class _To_SignupOTPState extends State<PassSignup> {
    String enteredPin = '';

    void onKeyPress(String value) {
      if (enteredPin.length < 4) {
        setState(() {
          enteredPin += value;
        });
      }
    }

    void onDelete() {
      if (enteredPin.isNotEmpty) {
        setState(() {
          enteredPin = enteredPin.substring(0, enteredPin.length - 1);
        });
      }
    }

    void onNextPressed() {
      if (enteredPin.length == 4) {
        // Navigate to the next screen if the PIN is valid (4 digits)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignupDone(),
          ),
        );
      } else {
        // Optionally, show an error if the PIN is not complete
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter a valid 4-digit PIN")),
        );
      }
    }

    Widget buildPinDots({double size = 20}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: size * 0.3),
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: index < enteredPin.length
                  ? const Color.fromARGB(255, 204, 203, 203)  // Dark color for entered digits
                  : Colors.white,  // White for unentered digits
              border: Border.all(color: Colors.lightBlueAccent),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                index < enteredPin.length ? enteredPin[index] : '',  // Show digit if entered
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          );
        }),
      );
    }

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
                          builder: (context) => const RegisterScreen(),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Input PIN Code",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "PIN code is required when you want to see your record in this app",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                  textAlign:TextAlign.center, // Ensures the text is centered if it spans multiple lines
                ),
              ),
              SizedBox(height: 40),
              buildPinDots(size: 31),
              SizedBox(height: 40),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: 11,
                  itemBuilder: (context, index) {
                    int? num;
                    if (index < 9) {
                      num = index + 1;
                    } else if (index == 9) {
                      num = null;
                    } else if (index == 10) {
                      num = 0;
                    }
                    return num != null
                        ? Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () => onKeyPress(num.toString()),
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.lightBlueAccent,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "$num",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlueAccent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        : Container(); // Return an empty container if num is null
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween, // Aligns children at both start and end
                  children: [
                    GestureDetector(
                      onTap: onDelete,
                      child: Text(
                        "Delete",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          // fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onNextPressed,
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          // fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      );
    }
  }

