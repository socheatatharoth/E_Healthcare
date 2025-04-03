import 'package:flutter/material.dart';
// import 'package:healthcare/Record/record_screen.dart';
import 'package:healthcare/Record/record_password.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ToForPassOTP());
  }
}

class ToForPassOTP extends StatefulWidget {
  @override
  _ToForPassOTPState createState() => _ToForPassOTPState();
}

class _ToForPassOTPState extends State<ToForPassOTP> {
  int _selectedTab = 0;

  final List<Map<String, String>> acceptedAppointments = [
    {
      "id": "0712",
      "doctor": "Dr. Thin Panha",
      "type": "Cardiologist",
      "name": "Jungkook",
      "date": "30 March 2025",
      "time": "10:00 PM",
    },
  ];

  final List<Map<String, String>> cancelledAppointments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 94, 170),
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
          "My Appointment",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child:
                _selectedTab == 0
                    ? _buildAppointmentList(acceptedAppointments)
                    : _buildAppointmentList(
                      cancelledAppointments,
                      cancelled: true,
                    ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [_buildTab("Accepted", 0), _buildTab("Cancelled", 1)],
    );
  }

  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _selectedTab == index ? Colors.blue : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: _selectedTab == index ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentList(
    List<Map<String, String>> appointments, {
    bool cancelled = false,
  }) {
    if (appointments.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.folder_open, size: 80, color: Colors.grey[400]),
            SizedBox(height: 10),
            Text(
              cancelled
                  ? "No cancelled appointments"
                  : "You haven't made any appointments yet",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return _buildAppointmentCard(appointment, cancelled);
      },
    );
  }

  Widget _buildAppointmentCard(
    Map<String, String> appointment,
    bool cancelled,
  ) {
    return Card(
      margin: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Text(
              "BOOKING ID : ${appointment['id']}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/doctor.png'),
                      radius: 25,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name : ${appointment['doctor']}",
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          "Type : ${appointment['type']}",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name : ", style: TextStyle(fontSize: 14)),
                    Text(
                      appointment['name']!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date : ", style: TextStyle(fontSize: 14)),
                    Text(appointment['date']!, style: TextStyle(fontSize: 14)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Time : ", style: TextStyle(fontSize: 14)),
                    Text(appointment['time']!, style: TextStyle(fontSize: 14)),
                  ],
                ),
                SizedBox(height: 10),
                if (!cancelled)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        cancelledAppointments.add(appointment);
                        acceptedAppointments.remove(appointment);
                      });
                    },
                    child: Text("Cancel"),
                  ),
                if (cancelled)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Cancelled",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RecordOTP()),
        );
        break;
      case 4:
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        break;
    }
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      currentIndex: 2,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Booking'),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Appointment',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.note_alt_outlined),
          label: 'Record',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
