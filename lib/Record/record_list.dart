import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare/Record/record_password.dart';
import 'package:healthcare/Appointment/appointment_screen.dart';

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
  int _selectedIndex = 0; // Initial selected index

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case 1:
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => BookingScreen()));
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AppointmentScreen()),
        );
        break;
      case 3:
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => RecordScreen()));
        break;
      case 4:
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 86, 118, 198),
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecordOTP()),
                );
              },
            ),
          ],
        ),
        title: Text(
          "Record",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
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
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            Divider(color: Colors.grey, thickness: 2),
            SizedBox(height: 5),
            ...records.map((record) => buildRecordCard(record)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensures all icons are shown
        currentIndex: _selectedIndex, // Active tab index
        selectedItemColor: Colors.grey, // Color of selected item
        unselectedItemColor: Colors.grey, // Color of unselected items
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            label: 'Appointment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_outlined, color: Colors.blue),
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
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    record['doctor']!,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
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
                                fontFamily: GoogleFonts.poppins().fontFamily,
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
                                fontFamily: GoogleFonts.poppins().fontFamily,
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
