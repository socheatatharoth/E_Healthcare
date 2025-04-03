import 'package:flutter/material.dart';
import 'package:healthcare/Profile/profile.dart';
import 'package:healthcare/Record/record_list.dart';
import 'package:healthcare/Record/record_password.dart';
import 'booking.dart';
import 'newfeed.dart';
import 'package:intl/intl.dart';

class AppointmentScheduler extends StatefulWidget {
  final Map<String, dynamic> doctor;

  const AppointmentScheduler({Key? key, required this.doctor})
    : super(key: key);

  @override
  _AppointmentSchedulerState createState() => _AppointmentSchedulerState();
}

class _AppointmentSchedulerState extends State<AppointmentScheduler> {
  String? selectedTime;
  String problemDescription = '';
  String fullName = '';
  String age = '';
  String? selectedGender;
  DateTime _currentMonth = DateTime.now();
  DateTime? _selectedDate;
  

  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> monthNames = DateFormat().dateSymbols.MONTHS;

  int _selectedIndex = 1; // Track selected tab index

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

  List<DateTime> getDaysInMonth() {
    var first = _currentMonth;
    var last = DateTime(first.year, first.month + 1, 0);
    return List.generate(
      last.day,
      (index) => DateTime(first.year, first.month, index + 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = getDaysInMonth();
    final firstDay = daysInMonth.first;
    final weekdayOffset = firstDay.weekday % 7;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 118, 198),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Book with ${widget.doctor['name']}',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Info Card
            Card(
              elevation: 2,
              margin: EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.doctor['image'],
                        width: 60,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.doctor['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            widget.doctor['specialty'],
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text(
                                '${widget.doctor['rating']} (${widget.doctor['reviews']} reviews)',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Date Selection
            Text(
              'Select Date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed:
                            _currentMonth.month > 1
                                ? () => setState(() {
                                  _currentMonth = DateTime(
                                    _currentMonth.year,
                                    _currentMonth.month - 1,
                                    1,
                                  );
                                })
                                : null,
                      ),
                      Text(
                        DateFormat('MMMM yyyy').format(_currentMonth),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.chevron_right),
                        onPressed:
                            _currentMonth.month < 12
                                ? () => setState(() {
                                  _currentMonth = DateTime(
                                    _currentMonth.year,
                                    _currentMonth.month + 1,
                                    1,
                                  );
                                })
                                : null,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 7,
                    children:
                        ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                            .map(
                              (day) => Center(
                                child: Text(
                                  day,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: weekdayOffset + daysInMonth.length,
                    itemBuilder: (context, index) {
                      if (index < weekdayOffset) {
                        return Container();
                      }
                      final day = daysInMonth[index - weekdayOffset];
                      final isSelected =
                          _selectedDate != null &&
                          _selectedDate!.year == day.year &&
                          _selectedDate!.month == day.month &&
                          _selectedDate!.day == day.day;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDate = day;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? Color.fromARGB(255, 86, 118, 198)
                                    : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Time Selection
            Text(
              'Select Time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children:
                  [
                    '09:00 AM',
                    '09:30 AM',
                    '10:00 AM',
                    '10:30 AM',
                    '11:00 AM',
                    '11:30 AM',
                    '03:00 PM',
                    '03:30 PM',
                    '04:00 PM',
                    '04:30 PM',
                    '05:00 PM',
                    '05:30 PM',
                  ].map((time) {
                    return ChoiceChip(
                      label: Text(time),
                      selected: selectedTime == time,
                      onSelected: (selected) {
                        setState(() {
                          selectedTime = selected ? time : null;
                        });
                      },
                      selectedColor: Color.fromARGB(255, 86, 118, 198),
                      labelStyle: TextStyle(
                        color:
                            selectedTime == time ? Colors.white : Colors.black,
                      ),
                    );
                  }).toList(),
            ),
            SizedBox(height: 20),

            // Patient Details
            Text(
              'Patient Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) => fullName = value,
            ),
            SizedBox(height: 10),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) => age = value,
            ),
            SizedBox(height: 10),

            Text('Gender'),
            Wrap(
              spacing: 8.0,
              children:
                  genders.map((gender) {
                    return ChoiceChip(
                      label: Text(gender),
                      selected: selectedGender == gender,
                      onSelected: (selected) {
                        setState(() {
                          selectedGender = selected ? gender : null;
                        });
                      },
                      selectedColor: Color.fromARGB(255, 86, 118, 198),
                      labelStyle: TextStyle(
                        color:
                            selectedGender == gender
                                ? Colors.white
                                : Colors.black,
                      ),
                    );
                  }).toList(),
            ),
            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: 'Describe your problem',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 3,
              onChanged: (value) => problemDescription = value,
            ),
            SizedBox(height: 20),

            // Confirm Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (fullName.isEmpty ||
                      age.isEmpty ||
                      selectedGender == null ||
                      _selectedDate == null ||
                      selectedTime == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill all details!')),
                    );
                    return;
                  }

                  final formattedDate = DateFormat(
                    'MMMM d, yyyy',
                  ).format(_selectedDate!);
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: Text('Appointment Confirmed'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Doctor: ${widget.doctor['name']}'),
                              Text('Date: $formattedDate at $selectedTime'),
                              Text(
                                'Patient: $fullName ($age, $selectedGender)',
                              ),
                              SizedBox(height: 10),
                              Text('We will send you a confirmation shortly.'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                  );
                },
                child: Text('Confirm Appointment'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 86, 118, 198),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
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
