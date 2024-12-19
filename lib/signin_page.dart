import 'package:flutter/material.dart';
import 'welcome_dashboard.dart';
import 'signup_page.dart';

class SigninPage extends StatefulWidget {
  @override
  SigninPageState createState() => SigninPageState();
}

class SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email, _password;
  String? _selectedRole; // Variable for selected role
  bool _rememberMe = false; // Variable for Remember Me checkbox

  final List<String> _roles = ['Donor', 'Recipient']; // Roles list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Logo
              Image.asset(
                'assets/blood_logo.png', // Ensure this asset is correctly added
                height: 100,
              ),
              SizedBox(height: 16),

              // Slogan
              Text(
                "Heroes don't wear capes - some donate blood",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),

              // Email field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _email = value,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter an email' : null,
              ),
              SizedBox(height: 16),

              // Password field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onSaved: (value) => _password = value,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a password' : null,
              ),
              SizedBox(height: 16),

              // Role selection dropdown
              DropdownButtonFormField<String>(
                value: _selectedRole,
                decoration: InputDecoration(
                  labelText: 'Select Role',
                  border: OutlineInputBorder(),
                ),
                items: _roles.map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedRole = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a role' : null,
              ),
              SizedBox(height: 16),

              // Remember Me checkbox
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  Text('Remember Me'),
                ],
              ),
              SizedBox(height: 16),

              // Sign-in button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_email == 'admin' &&
                        _password == 'admin' &&
                        _selectedRole != null) {
                      // Navigate to WelcomeDashboard
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeDashboard()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invalid credentials! Try again.'),
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Sign In'),
              ),
              SizedBox(height: 16),

              // Don't have an account? Click here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SignupPage()), // Navigate to SignupPage
                      );
                    },
                    child: Text('Click here'),
                  ),
                ],
              ),

              // Forgot password
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('Forgot password functionality coming soon!')),
                  );
                },
                child: Text('Forgot password?'),
              ),
              SizedBox(height: 16),

              // Sign in with Facebook and Google
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Sign in with Facebook coming soon!')),
                      );
                    },
                    icon: Icon(Icons.facebook),
                    label: Text('Facebook'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Sign in with Google coming soon!')),
                      );
                    },
                    icon: Icon(Icons.email),
                    label: Text('Google'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
