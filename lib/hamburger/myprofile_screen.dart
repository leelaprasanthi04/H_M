// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Your App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyAccountScreen(),
//     );
//   }
// }
//
// class MyAccountScreen extends StatefulWidget {
//   @override
//   _MyAccountScreenState createState() => _MyAccountScreenState();
// }
//
// class _MyAccountScreenState extends State<MyAccountScreen> {
//   bool _isEditing = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Account'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               setState(() {
//                 _isEditing = !_isEditing; // Toggle editing mode
//               });
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Avatar section
//               Center(
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage('assets/usericon.png'),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'My Info',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         _isEditing = !_isEditing; // Toggle editing mode
//                       });
//                     },
//                     child: Text(_isEditing ? 'Done' : 'Edit'),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Text fields for user info
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'First Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 initialValue: 'John', // Change this to the initial value of the first name
//                 enabled: _isEditing, // Enable editing mode
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Last Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 initialValue: 'Doe', // Change this to the initial value of the last name
//                 enabled: _isEditing, // Enable editing mode
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 initialValue: 'john.doe@example.com', // Change this to the initial value of the email
//                 enabled: _isEditing, // Enable editing mode
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Mobile',
//                   border: OutlineInputBorder(),
//                 ),
//                 initialValue: '1234567890', // Change this to the initial value of the mobile number
//                 enabled: _isEditing, // Enable editing mode
//               ),
//               SizedBox(height: 20),
//               // Expand to fill remaining space
//               Expanded(child: Container()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Your App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyAccountScreen(),
//     );
//   }
// }
//
// class MyAccountScreen extends StatefulWidget {
//   @override
//   _MyAccountScreenState createState() => _MyAccountScreenState();
// }
//
// class _MyAccountScreenState extends State<MyAccountScreen> {
//   bool _isEditing = false;
//   TextEditingController _firstNameController =
//   TextEditingController(text: 'John');
//   TextEditingController _lastNameController =
//   TextEditingController(text: 'Doe');
//   TextEditingController _emailController =
//   TextEditingController(text: 'john.doe@example.com');
//   TextEditingController _mobileController =
//   TextEditingController(text: '1234567890');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Account'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.edit),
//             onPressed: () {
//               setState(() {
//                 _isEditing = !_isEditing;
//               });
//             },
//           ),
//         ],
//       ),
//       resizeToAvoidBottomInset: true,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage:
//                 AssetImage('assets/profile_pic.png'), // Update image path
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'My Info',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   if (_isEditing)
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           _isEditing = false;
//                         });
//                       },
//                       child: Text('Done'),
//                     ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _firstNameController,
//                 decoration: InputDecoration(
//                   labelText: 'First Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 enabled: _isEditing,
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _lastNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Last Name',
//                   border: OutlineInputBorder(),
//                 ),
//                 enabled: _isEditing,
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 enabled: _isEditing,
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _mobileController,
//                 decoration: InputDecoration(
//                   labelText: 'Mobile',
//                   border: OutlineInputBorder(),
//                 ),
//                 enabled: _isEditing,
//               ),
//               SizedBox(height: 300), // Add extra space to scroll when the keyboard is open
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyAccountScreen(),
    );
  }
}

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  bool _isEditing = false;
  TextEditingController _firstNameController =
  TextEditingController(text: 'John');
  TextEditingController _lastNameController =
  TextEditingController(text: 'Doe');
  TextEditingController _emailController =
  TextEditingController(text: 'john.doe@example.com');
  TextEditingController _mobileController =
  TextEditingController(text: '1234567890');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:
                AssetImage('assets/profile_pic.png'), // Update image path
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Info',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  if (_isEditing)
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isEditing = false;
                        });
                      },
                      child: Text('Done'),
                    ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                enabled: _isEditing,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
                enabled: _isEditing,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                enabled: _isEditing,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(
                  labelText: 'Mobile',
                  border: OutlineInputBorder(),
                ),
                enabled: _isEditing,
              ),
              SizedBox(height: 300), // Add extra space to scroll when the keyboard is open
            ],
          ),
        ),
      ),
    );
  }
}