import 'package:flutter/material.dart';
import 'package:healthcare/Profile/change_pass.dart';
import 'package:healthcare/Profile/profile.dart';
import 'package:healthcare/Profile/two_factor.dart';
import 'package:healthcare/Record/record_list.dart';
import 'package:healthcare/mainscreen/detail.dart';
import 'package:healthcare/mainscreen/newfeed.dart';

class Prviacy extends StatefulWidget {
  const Prviacy({super.key});

  @override
  State<Prviacy> createState() => _PrviacyState();
}

class _PrviacyState extends State<Prviacy> {
  bool _ischecked = false;
  bool _ischecked1 = false;
  bool _ischecked2 = false;
  int _selectedIndex = 4;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()), // Navigate to Privacy page
    );
    }else if(index == 1){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DoctorInfoScreen()), // Navigate to Privacy page
    );
    }else if(index == 3){
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ToRecordList()), // Navigate to Privacy page
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
          leading: IconButton(
                     icon: Icon(Icons.arrow_back_ios),
                     color: Colors.white,
                     onPressed: () {
                        Navigator.pop(context);    
                      },
                        ),
          title: Center(child: Text("Privacy & Security",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
          backgroundColor: Color.fromARGB(255, 50, 105, 201),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 35,left: 35,right: 25),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Text("Change password"),
                    SizedBox(
                      width: 247,
                      child: Text("Change password"),
                      ),
                    IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ChangePass()), // Navigate to NextPage
                                );
                            },
                            color: Colors.blue,
                            )
                  ],
                ),
                SizedBox(height: 20,),
                 Row(
                  children: [
                    
                    SizedBox(
                      width: 260,
                      child:Text("Reset Security questions"),
                    ),
                    Icon(Icons.arrow_forward_ios,color: Colors.blue,)
                  ],
                ),
                SizedBox(height: 20,),
                 Row(
                  children: [
                    
                    SizedBox(
                      width: 250,
                      child:Text("Two factor Authentication"),
                    ),
                    IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TwoFactor()), // Navigate to NextPage
                                );
                            },
                            color: Colors.blue,
                            )
                  ],
                ),
                SizedBox(height: 20,),
                 Row(
                  children: [
                    
                    SizedBox(
                      width: 260,
                      child:Text("Device"),
                    ),
                    Icon(Icons.arrow_forward_ios,color: Colors.blue,)
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 1,
                                color: const Color.fromARGB(245, 67, 66, 66)
                              )
                            )
                          ),
                        
                         ),
                SizedBox(height: 20,),
                 Row(
                  children: [
                    
                    SizedBox(
                      width: 230,
                      child:Text("Saved Login"),
                    ),
                    IconButton(
                      icon: Icon(
                        _ischecked
                          ? Icons.toggle_on // Show password icon
                          : Icons.toggle_off,
                          color: _ischecked ? Colors.blue : Colors.grey,// Hide password icon
                        ),
                        iconSize: 45,
                          onPressed: () {
                          setState(() {
                            _ischecked = !_ischecked;  // Toggle password visibility
                            });
                          },
                        ),
                  ],
                ),
                Row(
                  children: [
                    
                    SizedBox(
                      width: 230,
                      child:Text("Login alerts"),
                    ),
                    IconButton(
                      icon: Icon(
                        _ischecked1
                          ? Icons.toggle_on // Show password icon
                          : Icons.toggle_off,
                          color: _ischecked1 ? Colors.blue : Colors.grey,// Hide password icon
                        ),
                        iconSize: 45,
                          onPressed: () {
                          setState(() {
                            _ischecked1 = !_ischecked1;  // Toggle password visibility
                            });
                          },
                        ),
                  ],
                ),
                Row(
                  children: [
                    
                    SizedBox(
                      width: 230,
                      child:Text("Security alerts"),
                    ),
                    IconButton(
                      icon: Icon(
                        _ischecked2
                          ? Icons.toggle_on // Show password icon
                          : Icons.toggle_off,
                          color: _ischecked2 ? Colors.blue : Colors.grey,// Hide password icon
                        ),
                        iconSize: 45,
                          onPressed: () {
                          setState(() {
                            _ischecked2 = !_ischecked2;  // Toggle password visibility
                            });
                          },
                        ),
                  ],
                ),
              ],
            ),
          ),
        ),
          bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Ensures all icons are shown
          currentIndex: _selectedIndex, // Active tab index
          selectedItemColor: Colors.blue, // Color of selected item
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontSize: 12), // Adjust text size
          unselectedLabelStyle: TextStyle(fontSize: 10), // Color of unselected items
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
}