import 'package:flutter/material.dart';
import 'package:healthcare/Profile/Noti_set.dart';
import 'package:healthcare/Profile/Pro_detail.dart';
import 'package:healthcare/Profile/Prviacy.dart';
import 'package:healthcare/Profile/help_center.dart';
import 'package:healthcare/Record/record_list.dart';
import 'package:healthcare/Record/record_password.dart';
import 'package:healthcare/StartApp/GetStart.dart';
import 'package:healthcare/mainscreen/booking.dart';
import 'package:healthcare/mainscreen/newfeed.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
    int _selectedIndex = 4; // Track selected tab index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0){
      Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (route) => false, // This removes all previous routes
    );
    }else if(index == 1){
      Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => BookingPage()),
      (route) => false, // This removes all previous routes
    );
    }else if(index == 3){
      Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => RecordPassword()),
      (route) => false, // This removes all previous routes
    );
    }else if (index == 4) { // Profile screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Profile()),
      (route) => false, // This removes all previous routes
    );
  } else {
    setState(() {
      _selectedIndex = index;
    });
  }
  }
  @override
  Widget build(BuildContext context) {
    return
      // debugShowCheckedModeBanner: false,
      Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.arrow_back_ios, color: Colors.white,),
          title: Center(child: Text("Jeon Jungkook",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
          backgroundColor: Color.fromARGB(255, 50, 105, 201),
        ),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: double.infinity, // Ensures it takes full width if necessary
                      child: Image.asset(
                        "images/cat1.png",
                        fit: BoxFit.cover, // Makes the image fill the SizedBox completely
                      ),
                    ),
                    Container(
                      height: 80,
                    )
                  ],
                ),
                Positioned(
                  top: 60,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    // child: CircleAvatar(
                    //   radius: 48,
                    backgroundImage: AssetImage("images/profile.png"),
                    // ),
                  ),
                )
              ],
            ),
            // SizedBox(height: 5),
            Text(
              "Jeon Jungkook",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "User",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            SizedBox(height: 5),
            Text(
              "I'm a super star",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 50,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                  color: Colors.blue[100],
                  
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 35,top: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.people_alt
                          ),
                          SizedBox(width: 40,),
                          SizedBox(
                            width: 210,
                            child: Text('Profile', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),)),
                          // SizedBox(width: 280,),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Pro_detail()), // Navigate to NextPage
                                );
                            },
                            )
                        ],
                      ),
                      // SizedBox(height: 20,),
                       Row(
                        children: [
                          Icon(
                            Icons.lock
                          ),
                          SizedBox(width: 40,),
                          SizedBox(
                            width: 210,
                            child: Text('Privacy & Security', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),)),
                          // SizedBox(width: 188,),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Prviacy()), // Navigate to NextPage
                                );
                            },
                            )
                        ],
                      ),
                      // SizedBox(height: 20,),
                       Row(
                        children: [
                          Icon(
                            Icons.lightbulb
                          ),
                          SizedBox(width: 40,),
                          SizedBox(
                            width: 210,
                            child: Text('Notification setting', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),)),
                          // SizedBox(width: 178,),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Noti_setting()), // Navigate to NextPage
                                );
                            },
                            )
                        ],
                      ),
                      // SizedBox(height: 20,),
                      Row(
                        children: [
                          Icon(
                            Icons.question_mark_outlined
                          ),
                          SizedBox(width: 40,),
                          SizedBox(
                            width: 210,
                            child: Text('Help', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),)),
                          // SizedBox(width: 280,),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                                 Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HelpCenter()), // Navigate to NextPage
                                );

                            },
                            )
                        ],
                      ),
                      // SizedBox(height: 20,),
                      Row(
                        children: [
                          Icon(
                            Icons.logout
                          ),
                          SizedBox(width: 40,),
                          SizedBox(
                            width: 210,
                            child: Text('Logout', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),)),
                          // SizedBox(width: 280,),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              _showLogoutDialog(context); // Call function to show logout popup
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  ),
              ),
              )
          ],
        ),
          bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, 
          selectedLabelStyle: TextStyle(fontSize: 12), // Adjust text size
          unselectedLabelStyle: TextStyle(fontSize: 10),// Ensures all icons are shown
          currentIndex: _selectedIndex, // Active tab index
          selectedItemColor: Colors.blue, // Color of selected item
          unselectedItemColor: Colors.grey, // Color of unselected items
          onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined),
            label: 'Record',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Profile',
          ),
         
        ],
        
      ),
 
      );
  }
   // Function to show the Logout Confirmation Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            // Cancel Button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text("Cancel"),
            ),
            // Logout Button
            TextButton(
              onPressed: () {
                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GetStart()), // Navigate to NextPage
                                );// Close dialog
                // _logoutUser(context); // Call logout function
              },
              child: Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

   // Function to perform logout logic
  // void _logoutUser(BuildContext context) {
  //   // Perform logout logic here (e.g., clear user session, navigate to login screen)
    
  //   // Example: Navigate back to login screen after logout
  //   Navigator.pushReplacementNamed(context, '/login'); // Ensure you have defined '/login' in routes
  // }
}


 
