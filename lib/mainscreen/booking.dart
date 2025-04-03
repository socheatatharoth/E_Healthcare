import 'package:flutter/material.dart';
import 'detail.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> allDoctors = [];
  List<Map<String, dynamic>> filteredDoctors = [];
  Set<String> favoriteDoctors = {};
  int _selectedIndex = 1;
  String _selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    allDoctors = [
      {
        'name': 'Dr. Thin Panha',
        'specialty': 'General',
        'rating': 5.0,
        'reviews': 1872,
        'image': 'assets/images/doctor1.png',
      },
      {
        'name': 'Dr. Tha Rothsocheata',
        'specialty': 'Medical',
        'rating': 4.9,
        'reviews': 127,
        'image': 'assets/images/doctor2.png',
      },
      {
        'name': 'Dr. Samnang Sokinin',
        'specialty': 'Oncologist',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor3.png',
      },
      {
        'name': 'Dr. Than Monyroza',
        'specialty': 'Dermatologist',
        'rating': 4.7,
        'reviews': 5223,
        'image': 'assets/images/doctor3.png',
      },
      {
        'name': 'Dr. Phorn Noucheav',
        'specialty': 'Cardiologist',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor4.png',
      },
      {
        'name': 'Dr. Sim Sokly',
        'specialty': 'Endocrinologist',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor5.png',
      },
      {
        'name': 'Dr.Tang Sonika',
        'specialty': 'Nurse',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor12.png',
      },
      {
        'name': 'Dr.Sar Sovannita',
        'specialty': 'Anesthesiology',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor13.png',
      },
      {
        'name': 'Dr.Chan Serey',
        'specialty': 'Surgery',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor6.png',
      },
      {
        'name': 'Dr.Bun Leap',
        'specialty': 'Nurse',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor7.png',
      },
      {
        'name': 'Dr.Rotana Kia',
        'specialty': 'Ophthalmology',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor8.png',
      },
      {
        'name': 'Dr.Un Chunly',
        'specialty': 'Pathology',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor9.png',
      },
      {
        'name': 'Dr.Vong Soukorng',
        'specialty': 'General practitioner',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor10.png',
      },
      {
        'name': 'Dr.Khun Dararith',
        'specialty': 'Body and Skin Issues',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor11.png',
      },
      {
        'name': 'Dr.Ang Mengchhoung',
        'specialty': 'Depression Issues',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor14.png',
      },
      {
        'name': 'Dr.Jonh Doe',
        'specialty': 'Nurse',
        'rating': 4.8,
        'reviews': 3467,
        'image': 'assets/images/doctor15.png',
      },
    ];

    allDoctors.sort((a, b) => a['name'].compareTo(b['name']));
    filteredDoctors = List.from(allDoctors);
  }

  void _searchDoctor(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredDoctors = List.from(allDoctors);
      } else {
        filteredDoctors =
            allDoctors
                .where(
                  (doctor) => doctor['name'].toLowerCase().contains(
                    query.toLowerCase(),
                  ),
                )
                .toList();
      }
    });
  }

  void _toggleFavorite(String doctorName) {
    setState(() {
      if (favoriteDoctors.contains(doctorName)) {
        favoriteDoctors.remove(doctorName);
      } else {
        favoriteDoctors.add(doctorName);
      }
    });
  }

  void _updateFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
      if (filter == 'All') {
        filteredDoctors = List.from(allDoctors);
      } else {
        filteredDoctors =
            allDoctors
                .where((doctor) => doctor['specialty'] == filter)
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking"),
        backgroundColor: const Color.fromARGB(255, 86, 118, 198),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _searchDoctor,
              decoration: InputDecoration(
                hintText: 'Search doctor...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('All'),
                  SizedBox(width: 8),
                  _buildFilterChip('Cardiologist'),
                  SizedBox(width: 8),
                  _buildFilterChip('Medical'),
                  SizedBox(width: 8),
                  _buildFilterChip('Surgery'),
                  SizedBox(width: 8),
                  _buildFilterChip('Nurse'),
                  // Add other filter chips as needed
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = filteredDoctors[index];
                  bool isFavorite = favoriteDoctors.contains(doctor['name']);

                  return Card(
                    margin: EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => DoctorInfoScreen(doctor: doctor),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                doctor['image'],
                                width: 80,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctor['name'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    doctor['specialty'],
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '${doctor['rating']} (${doctor['reviews']} reviews)',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey,
                              ),
                              onPressed: () => _toggleFavorite(doctor['name']),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: _selectedFilter == label,
      onSelected: (_) => _updateFilter(label),
      selectedColor: Color.fromARGB(255, 86, 118, 198),
      backgroundColor: Colors.grey[200],
      labelStyle: TextStyle(
        color: _selectedFilter == label ? Colors.white : Colors.black,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
