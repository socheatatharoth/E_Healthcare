

import 'package:flutter/material.dart';
import 'package:healthcare/ForgetPassword/forget_password.dart';
import 'package:healthcare/Profile/profile.dart';
import 'package:healthcare/RegisterAccount/singup.dart';
import 'package:healthcare/StartApp/GetStart.dart';
import 'otp.dart';


class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 GestureDetector(
                   onTap: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GetStart(),
                      ),
                );
                    },
                   child: Row(
                    // mainAxisSize: MainAxisSize.min, // Make row fit content
                    children: [
                      Icon(Icons.arrow_back_ios, size: 18,color: Color.fromARGB(255, 50, 105, 201),),  // Reduce spacing between icon and text
                      Text(
                        "Back",
                        style: TextStyle(
                          color: Color.fromARGB(255, 50, 105, 201),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                    ),
                 ),
                 SizedBox(height: 20,),
                   Center(
                    child: Text('Welcome to Your Account',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                   ),
                SizedBox(height: 10,),
                   Center(
                    child: SizedBox(
                      width: 210,
                      child: Text('welcome back! Please login to access your account',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w200,fontSize: 12,))),
                   ),

                SizedBox(height: 15,),
                Text("Phone Number /Gmail", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        labelText: "Enter your email or phone number",
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold
                        ),
                       
                        filled: true,
                        fillColor: Color(0xFFD7DEFC), 
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                    ),
                  ),
                SizedBox(height: 10,),
                Text("Password", style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                  SizedBox(
                    height: 40,
                    child: TextFormField(
                      obscureText: !_isPasswordVisible,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        labelText: "Enter password",
                        labelStyle: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold
                        ),
                         suffixIcon:  IconButton(
                          icon: Icon(
                            _isPasswordVisible 
                                ? Icons.visibility // Show password icon
                                : Icons.visibility_off, // Hide password icon
                          ),
                          color: Colors.grey[500],
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;  // Toggle password visibility
                            });
                          },
                        ),
                        filled: true,
                        fillColor: Color(0xFFD7DEFC), 
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                    GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgetPassword()));
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      "Forget password?",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff2972ff)),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForOTP()));
                      }, 
                      child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 17),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 4, 132, 245),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                      ),
                  ),
                ),
                SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey[400], 
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or login with",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Facebook button
                        GestureDetector(
                          onTap: () {
                            // Handle Facebook login
                          },
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child:  Image.asset("./images/facebook.png"), // Add your Facebook icon image
                          ),
                        ),
                        SizedBox(width: 20),
                        // Google button
                        GestureDetector(
                          onTap: () {
                            // Handle Google login
                          },
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                            child:  Image.asset("./images/google.png",), // Add your Google icon image
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: 150,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",style: TextStyle(color: const Color.fromARGB(239, 223, 221, 221)),),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RegisterScreen()));
                            },
                            child: Text("Register",style: TextStyle(color: Colors.blueAccent),),
                          ),
                          
                        ],
                      ),
              ],
            ),
        
        ),
      );
  }
}