import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentScheduler extends StatefulWidget {
  @override
  _AppointmentSchedulerState createState() => _AppointmentSchedulerState();
}

class _AppointmentSchedulerState extends State<AppointmentScheduler> {
  String? selectedTime;
  String problemDescription = '';
  String fullName = '';
  String age = '';
  String? selectedGender;
  DateTime _currentMonth = DateTime(2025, 1, 1);
  DateTime? _selectedDate;
  int _selectedIndex = 2; // Default to Appointment tab

  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> monthNames = DateFormat().dateSymbols.MONTHS;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Add navigation logic here based on the selected index
    // For example:
    // if (index == 0) Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
    final weekdayOffset = firstDay.weekday % 7; // Sunday = 0

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 118, 198),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Goes back to the previous screen
          },
        ),
        title: const Text(
          'E-HealthCare',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Selecting Date Text
            Text(
              'Selecting Date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 10),

            // Calendar Container
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
                  // Month Selector
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

                  // Month Dropdown (alternative to arrows)
                  DropdownButton<int>(
                    value: _currentMonth.month,
                    items:
                        List.generate(12, (index) => index + 1)
                            .map(
                              (month) => DropdownMenuItem<int>(
                                value: month,
                                child: Text(monthNames[month - 1]),
                              ),
                            )
                            .toList(),
                    onChanged: (month) {
                      if (month != null) {
                        setState(() {
                          _currentMonth = DateTime(2025, month, 1);
                        });
                      }
                    },
                  ),
                  SizedBox(height: 16),

                  // Weekday Headers
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

                  // Calendar Days
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
                        return Container(); // Empty space before 1st of month
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
              'Select Hour',
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

            Text('Full Name'),
            TextField(
              onChanged: (value) {
                setState(() {
                  fullName = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),

            Text('Age'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  age = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter Age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
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

            Text('Describe your problem'),
            TextField(
              onChanged: (value) {
                setState(() {
                  problemDescription = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter Your Problem Here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 3,
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
                  print(
                    "Appointment Confirmed: $formattedDate at $selectedTime for $fullName ($age, $selectedGender)",
                  );

                  // Here you would typically navigate to confirmation page
                  // or show a success dialog
                },
                child: Text('Confirm'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 142, 166, 227),
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
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
