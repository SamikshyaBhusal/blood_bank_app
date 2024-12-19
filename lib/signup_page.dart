import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  // Declare instance variables
  String? _name;
  String? _phone;
  String? _email;
  String? _location;
  String? _bloodGroup;
  String? _dob;
  String? _gender;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => _name = value,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                onSaved: (value) => _phone = value,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your phone number' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _email = value,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your email' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                onSaved: (value) => _location = value,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your location' : null,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Blood Group'),
                onChanged: (value) => setState(() => _bloodGroup = value),
                items: ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-']
                    .map((bloodGroup) => DropdownMenuItem(
                          value: bloodGroup,
                          child: Text(bloodGroup),
                        ))
                    .toList(),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date of Birth'),
                onSaved: (value) => _dob = value,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your date of birth' : null,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Gender'),
                onChanged: (value) => setState(() => _gender = value),
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) => _password = value,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your password' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Handle the signup logic here
                    print(
                        'Name: $_name, Phone: $_phone, Email: $_email, Location: $_location, Blood Group: $_bloodGroup, DOB: $_dob, Gender: $_gender, Password: $_password');
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
