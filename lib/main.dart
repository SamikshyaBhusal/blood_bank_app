import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BloodDonationApp());
}

class BloodDonationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blood Donation App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // State for login page
  String selectedRole = 'Donor';
  bool rememberMe = false;

  void toggleRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  void updateRole(String role) {
    selectedRole = role;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page = Placeholder();
    switch (selectedIndex) {
      case 0:
        page = LoginPage();
        break;
      // Future case for other pages like Dashboard
      case 1:
        page = Center(child: Text("Other Features Coming Soon"));
        break;
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.login),
                  label: Text('Login'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard),
                  label: Text('Dashboard'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
// Add Slogan
          Text(
            "Heroes Don’t Always Wear Capes – Sometimes They Donate Blood.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20), // Add some space below the slogan

          // Role Selection
          Text(
            'Sign in as:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          DropdownButton<String>(
            value: appState.selectedRole,
            items: ['Donor', 'Receiver', 'Organization', 'Hospital']
                .map((role) => DropdownMenuItem(
                      value: role,
                      child: Text(role),
                    ))
                .toList(),
            onChanged: (value) {
              appState.updateRole(value!);
            },
          ),
          SizedBox(height: 16),

          // ID Field
          TextField(
            controller: idController,
            decoration: InputDecoration(
              labelText: 'ID',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),

          // Password Field
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),

          // Remember Me
          Row(
            children: [
              Checkbox(
                value: appState.rememberMe,
                onChanged: (value) {
                  appState.toggleRememberMe();
                },
              ),
              Text('Remember me'),
            ],
          ),
          SizedBox(height: 16),

          // Sign-In Button
          ElevatedButton(
            onPressed: () {
              // Handle sign-in logic
              print('Sign in as ${appState.selectedRole}');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text('Sign In'),
          ),
          SizedBox(height: 16),

          // Create Account Link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  // Navigate to Sign Up Page
                },
                child: Text('Click here'),
              ),
            ],
          ),
          SizedBox(height: 8),

          // Forgot Password Link
          TextButton(
            onPressed: () {
              // Navigate to Forgot Password Page
            },
            child: Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.deepOrange),
            ),
          ),
        ],
      ),
    );
  }
}
