import 'package:flutter/material.dart';
import 'package:healthcare/Profile/profile.dart';
import 'package:healthcare/mainscreen/detail.dart';
import 'package:healthcare/mainscreen/newfeed.dart';
import 'record_password.dart';

class RecodList extends StatelessWidget {
  const RecodList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ToRecordList());
  }
}

class ToRecordList extends StatefulWidget {
  const ToRecordList({super.key});

  @override
  _ToRecordListState createState() => _ToRecordListState();
}

class _ToRecordListState extends State<ToRecordList> {
  final List<Map<String, String>> records = [
    {
      "date": "Friday, 10 January",
      "time": "9:30 - 10:00 AM",
      "doctor": "Dr. Thin Panha, Ph.D.",
      "hospital": "E-Healthcare Hospital",
    },
    {
      "date": "Tuesday, 8 October",
      "time": "9:30 - 10:00 AM",
      "doctor": "Dr. Thin Panha, Ph.D.",
      "hospital": "E-Healthcare Hospital",
    },
  ];
    int _selectedIndex = 3; // Track selected tab index

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
      MaterialPageRoute(builder: (context) => DoctorInfoScreen()),
      (route) => false, // This removes all previous routes
    );
    }else if(index == 3){
      Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => ToRecordList()),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 118, 198),
        
        title: Text(
          "Record",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Text(
              "2025",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                // fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            Divider(color: Colors.grey, thickness: 2),
            SizedBox(height: 5),
            ...records.map((record) => buildRecordCard(record)),
          ],
        ),
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

  Widget buildRecordCard(Map<String, String> record) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 57,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image(
                image: AssetImage('assets/images/record_image.png'),
                width: 45,
                height: 57,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hospital: ${record['hospital']}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      // fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    record['doctor']!,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      // fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 8,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 5),
                            Text(
                              record['date']!,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                // fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 8,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 5),
                            Text(
                              record['time']!,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                // fontFamily: GoogleFonts.poppins().fontFamily,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
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
