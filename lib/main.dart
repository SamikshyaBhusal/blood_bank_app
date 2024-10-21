import 'package:flutter/material.dart';

void main() => runApp(BloodBankApp());

class BloodBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Bank Management',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blood Bank Management')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Donor List'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonorListScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Blood Inventory'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InventoryScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DonorListScreen extends StatelessWidget {
  final List<String> donors = ['John Doe', 'Jane Smith', 'Bob Johnson'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donor List')),
      body: ListView.builder(
        itemCount: donors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(donors[index]),
            onTap: () {
              // TODO: Implement donor details screen
            },
          );
        },
      ),
    );
  }
}

class InventoryScreen extends StatelessWidget {
  final Map<String, int> inventory = {
    'A+': 10,
    'B+': 15,
    'O+': 20,
    'AB+': 5,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blood Inventory')),
      body: ListView.builder(
        itemCount: inventory.length,
        itemBuilder: (context, index) {
          String bloodType = inventory.keys.elementAt(index);
          int units = inventory[bloodType]!;
          return ListTile(
            title: Text('$bloodType: $units units'),
          );
        },
      ),
    );
  }
}