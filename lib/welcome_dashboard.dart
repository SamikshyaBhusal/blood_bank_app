import 'package:flutter/material.dart';
import 'blood_requests_page.dart';
import 'profile_page.dart';

class WelcomeDashboard extends StatefulWidget {
  @override
  WelcomeDashboardState createState() => WelcomeDashboardState();
}

class WelcomeDashboardState extends State<WelcomeDashboard> {
  int selectedIndex = 0;

  // Variables for dropdown selections
  String? selectedlocation;
  String? selectedBloodGroup;

  @override
  Widget build(BuildContext context) {
    // Define the pages dynamically inside the build method
    final List<Widget> pages = [
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Blood Finder',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select location',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.location_on),
                ),
                items: [
                  DropdownMenuItem(
                    value: 'location1',
                    child: Text('location1'),
                  ),
                  DropdownMenuItem(
                    value: 'location2',
                    child: Text('location2'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedlocation = value;
                  });
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Blood Group',
                  border: OutlineInputBorder(),
                ),
                items: [
                  DropdownMenuItem(
                    value: 'A+',
                    child: Text('A+'),
                  ),
                  DropdownMenuItem(
                    value: 'A-',
                    child: Text('A-'),
                  ),
                  DropdownMenuItem(
                    value: 'B+',
                    child: Text('B+'),
                  ),
                  DropdownMenuItem(
                    value: 'B-',
                    child: Text('B-'),
                  ),
                  DropdownMenuItem(
                    value: 'AB+',
                    child: Text('AB+'),
                  ),
                  DropdownMenuItem(
                    value: 'AB-',
                    child: Text('AB-'),
                  ),
                  DropdownMenuItem(
                    value: 'O+',
                    child: Text('O+'),
                  ),
                  DropdownMenuItem(
                    value: 'O-',
                    child: Text('O-'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedBloodGroup = value;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  // Perform search logic here
                  print(
                      'Searching for $selectedBloodGroup blood in $selectedlocation');
                },
                icon: Icon(Icons.search),
                label: Text('Find'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'More Items',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
                children: [
                  _buildGridItem(Icons.add, 'Add Request'),
                  _buildGridItem(Icons.local_hospital, 'Ambulance'),
                  _buildGridItem(Icons.event, 'Events'),
                  _buildGridItem(Icons.newspaper, 'News'),
                  _buildGridItem(Icons.local_pharmacy, 'BloodBank'),
                ],
              ),
            ],
          ),
        ),
      ),
      BloodRequestsPage(), // Blood Requests page
      ProfilePage(), //  Profile page
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Bank App'),
        backgroundColor: Colors.red,
      ),
      body: pages[selectedIndex], // Display selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bloodtype),
            label: 'Blood Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 36, color: Colors.red),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WelcomeDashboard(),
    debugShowCheckedModeBanner: false,
  ));
}
