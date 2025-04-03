import 'package:flutter/material.dart';
import 'package:healthcare/mainscreen/newfeed.dart';
// import 'package:google_fonts/google_fonts.dart';


class ForOTP extends StatefulWidget {
  const ForOTP({super.key});

  @override
  State<ForOTP> createState() => _ForOTPState();
}

class _ForOTPState extends State<ForOTP> {
final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); 
              },
            ),
      ),
       body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "OTP Verification",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                // fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Enter the verification code we just sent to your email',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                // fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  height: 50,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: '',
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty &&
                          !RegExp(r'^[0-9]').hasMatch(value)) {
                        _controllers[index].clear();
                        return;
                      }
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(
                          context,
                        ).requestFocus(_focusNodes[index + 1]);
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(
                          context,
                        ).requestFocus(_focusNodes[index - 1]);
                      }
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 20,),
            
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60, right: 30),
                    child: Row(
                      children: [
                        Text(
                          "Didn't receive code?",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            // fontFamily: GoogleFonts.poppins().fontFamily,
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const NewPassword(),
                            //   ),
                            // );
                          },
                          child: Text(
                            "Resend",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              // fontFamily: GoogleFonts.poppins().fontFamily,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 34, 96, 255),
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}