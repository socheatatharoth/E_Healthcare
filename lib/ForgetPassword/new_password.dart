import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/Record/record_list.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToNewPassword(),
    );
  }
}

class ToNewPassword extends StatefulWidget {
  @override
  _ToNewPasswordState createState() => _ToNewPasswordState();
}

class _ToNewPasswordState extends State<ToNewPassword> {
  bool _obscureTextPassword = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isValidPassword(String password) {
    final RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$%\^&\*])[A-Za-z\d!@#\$%\^&\*]{8,}$',
    );
    return passwordRegex.hasMatch(password);
  }

  void _validatePasswords() {
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (password.isEmpty || confirmPassword.isEmpty) {
      _showBeautifulAlert("Please enter both fields", success: false);
      return;
    }
    if (!_isValidPassword(password)) {
      _showBeautifulAlert(
        "Password must be at least 8 characters long and include at least one letter, one number, and one special character (! @ # \$ ...)",
        success: false,
      );
      return;
    }
    if (password == confirmPassword) {
      _showBeautifulAlert("Password reset successful!", success: true);
    } else {
      _showBeautifulAlert(
        "Passwords do not match. Please try again.",
        success: false,
      );
    }
  }

  void _showBeautifulAlert(String message, {bool success = false}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (success) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RecodList()),
            );
          });
        }

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor:
              success ? Colors.green.shade100 : Colors.red.shade100,
          title: Row(
            children: [
              Icon(
                success ? Icons.check_circle : Icons.error,
                color: success ? Colors.green : Colors.red,
              ),
              SizedBox(width: 10),
              Text(
                success ? "Success" : "Error",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: success ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          content: Text(
            message,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "Reset Password",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              obscureText: _obscureTextPassword,
              decoration: InputDecoration(
                labelText: "New Password :",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureTextPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureTextPassword = !_obscureTextPassword;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureTextPassword,
              decoration: InputDecoration(
                labelText: "Confirm Password :",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureTextPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureTextPassword = !_obscureTextPassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            
            Center(
              child: ElevatedButton(
                onPressed: _validatePasswords,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 34, 96, 255),
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your password must have at least:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Text(
              '• 8 characters',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Text(
              '• A letter and a number',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Text(
              '• A special character (! @ # ...)',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
