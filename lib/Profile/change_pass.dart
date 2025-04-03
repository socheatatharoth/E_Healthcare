


import 'package:flutter/material.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  bool logOutOtherDevices = false;
  bool _isPasswordVisible = false;
  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
                     icon: Icon(Icons.arrow_back_ios),
                     color: Colors.white,
                     onPressed: () {
                        Navigator.pop(context);    
                      },
                        ),
          title: Center(child: Text("Help center",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
          backgroundColor: Color.fromARGB(255, 50, 105, 201),
        
        ),
         body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your password must be at least 8 characters and should include a combination of numbers, letters and special characters (!@#\$%).",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 20),

            // Current Password
            TextField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: "Current password",
                filled: true,
                fillColor: Colors.blue[50],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
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
              ),
              
            ),
            SizedBox(height: 15),

            // New Password
            TextField(
              obscureText: !_isPasswordVisible1,
              decoration: InputDecoration(
                hintText: "New password",
                filled: true,
                fillColor: Colors.blue[50],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                suffixIcon:  IconButton(
                          icon: Icon(
                            _isPasswordVisible1 
                                ? Icons.visibility // Show password icon
                                : Icons.visibility_off, // Hide password icon
                          ),
                          color: Colors.grey[500],
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible1 = !_isPasswordVisible1;  // Toggle password visibility
                            });
                          },
                        ),
              ),
            ),
            SizedBox(height: 15),

            // Re-type New Password
            TextField(
              obscureText: !_isPasswordVisible2,
              decoration: InputDecoration(
                hintText: "Re-type new password",
                filled: true,
                fillColor: Colors.blue[50],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                suffixIcon:  IconButton(
                          icon: Icon(
                            _isPasswordVisible2 
                                ? Icons.visibility // Show password icon
                                : Icons.visibility_off, // Hide password icon
                          ),
                          color: Colors.grey[500],
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible2 = !_isPasswordVisible2;  // Toggle password visibility
                            });
                          },
                        ),
              ),
            ),
            SizedBox(height: 15),

            // Forgot Password Link
            GestureDetector(
              onTap: () {
                // Handle Forgot Password action
              },
              child: Text(
                "Forgot your password?",
                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),

            // Checkbox for Logout
            Row(
              children: [
                Checkbox(
                  value: logOutOtherDevices,
                  activeColor: Colors.blue,
                  onChanged: (bool? value) {
                    setState(() {
                      logOutOtherDevices = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    "Log out of other devices. Choose this if someone else used your account.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),

            SizedBox(height: 180,),

            // Change Password Button
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min, // Prevents extra height
                children: [
                  Divider(color: Colors.grey),  // Cleaner way to add a line
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 40, // Ensuring it fits the button
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 50, 105, 201),
                      ),
                      child: Text(
                        'Change Password',
                        style: TextStyle(color: Colors.white),
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