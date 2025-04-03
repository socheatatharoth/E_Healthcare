import 'package:flutter/material.dart';
import 'package:healthcare/Profile/profile.dart';
import 'package:healthcare/Record/record_list.dart';
import 'package:healthcare/Record/record_password.dart';
import 'booking.dart';
import 'newfeed.dart';
import 'appointmentdate.dart';

class DoctorInfoScreen extends StatefulWidget {
  final Map<String, dynamic> doctor;

  const DoctorInfoScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  _DoctorInfoScreenState createState() => _DoctorInfoScreenState();
}

class _DoctorInfoScreenState extends State<DoctorInfoScreen> {
  int _selectedIndex = 1;

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

  Widget _buildStatColumn(
    IconData icon,
    String value,
    String label, {
    Color iconColor = Colors.grey,
  }) {
    return Column(
      children: [
        Icon(icon, size: 28, color: iconColor),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 118, 198),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Doctor Detail Information',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Profile Card
            Card(
              elevation: 4.0,
              color: Color.fromARGB(255, 86, 118, 198),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        widget.doctor['image'],
                        width: 90,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.doctor['name'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Divider(
                                color: Colors.white.withOpacity(0.5),
                                thickness: 1,
                                height: 16,
                              ),
                              SizedBox(height: 4),
                              Text(
                                widget.doctor['specialty'],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 6.0),
                                  Text(
                                    widget.doctor['location'] ?? 'Phnom Penh',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              icon: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AppointmentScheduler(doctor: widget.doctor),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24),
            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn(
                  Icons.people_alt,
                  widget.doctor['patients'] ?? '2,000+',
                  'patients',
                  iconColor: Colors.blue,
                ),
                _buildStatColumn(
                  Icons.work_history,
                  widget.doctor['experience'] ?? '10+',
                  'experience',
                ),
                _buildStatColumn(
                  Icons.star,
                  widget.doctor['rating'].toString(),
                  'rating',
                ),
                _buildStatColumn(
                  Icons.reviews,
                  widget.doctor['reviews'].toString(),
                  'reviews',
                ),
              ],
            ),

            SizedBox(height: 28),
            // About Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About me',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    widget.doctor['about'] ??
                        'Experienced and compassionate doctor providing quality medical care, diagnosis, and treatment for various health conditions.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 28),
            // Working Time Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Working Time',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Text(
                    widget.doctor['workingTime'] ??
                        'Monday-Friday, 08:00 AM - 18:00 PM',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 28),
            // Reviews Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reviews',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/images/pf1.png'),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text(
                        'Emily Anderson',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) =>
                                Icon(Icons.star, color: Colors.amber, size: 18),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${widget.doctor['name']} is a true professional who genuinely cares about patients. I highly recommend to anyone seeking exceptional care.',
                          style: TextStyle(
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
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
}