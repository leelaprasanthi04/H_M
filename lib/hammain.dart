


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hamburger/hamburger/menupage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class AccountDetails extends ChangeNotifier {
  ValueNotifier<String> _firstNameNotifier = ValueNotifier<String>('John');
  ValueNotifier<String> get firstNameNotifier => _firstNameNotifier;

  String get firstName => _firstNameNotifier.value;

  ValueNotifier<String> _lastNameNotifier = ValueNotifier<String>('Kevis');
  ValueNotifier<String> get lastNameNotifier => _lastNameNotifier;

  String get lastName => _lastNameNotifier.value;

  ValueNotifier<String> _mobileNotifier = ValueNotifier<String>('Kevis');
  ValueNotifier<String> get mobileNotifier => _mobileNotifier;

  String get mobile => _mobileNotifier.value;

  ValueNotifier<String> _emailNotifier = ValueNotifier<String>('Kevis');
  ValueNotifier<String> get emailNotifier => _emailNotifier;

  String get email => _emailNotifier.value;

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firstName', _firstNameNotifier.value);
    prefs.setString('lastName', _lastNameNotifier.value);
    prefs.setString('email', _emailNotifier.value);
    prefs.setString('mobile', _mobileNotifier.value);
  }

  // Update the first name and notify listeners
  void updateFirstName(String newFirstName) {
    _firstNameNotifier.value = newFirstName;
    saveData();
    notifyListeners();
  }

  void updateLastName(String newLastName) {
    _lastNameNotifier.value = newLastName;
    saveData();
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _emailNotifier.value = newEmail;
    saveData();
    notifyListeners();
  }

  void updateMobile(String newMobile) {
    _mobileNotifier.value = newMobile;
    saveData();
    notifyListeners();
  }

// Other methods...
}

void main() async {
  // Load data from SharedPreferences
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadData(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ChangeNotifierProvider(
            create: (context) => AccountDetails(),
            child: MaterialApp(
              title: 'Your App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: HomePage(),
            ),
          );
        } else {
          return CircularProgressIndicator(); // Or any loading indicator
        }
      },
    );
  }
}

Future<void> loadData(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var accountDetails = Provider.of<AccountDetails>(context, listen: false);
  accountDetails.updateFirstName(prefs.getString('firstName') ?? '');
  accountDetails.updateLastName(prefs.getString('lastName') ?? '');
  accountDetails.updateEmail(prefs.getString('email') ?? '');
  accountDetails.updateMobile(prefs.getString('mobile') ?? '');
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your App'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Consumer<AccountDetails>(
//                 builder: (context, accountDetails, _) {
//                   return Text(
//                     'Hello ${accountDetails.firstName}',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.account_circle),
//               title: Text('My Profile'),
//               onTap: () {
//                 // Navigate to My Account screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MyAccountScreen(),
//                   ),
//                 );
//               },
//             ),
//             // Other list tile items...
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text('Home Page'),
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your App'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Consumer<AccountDetails>(
//                 builder: (context, accountDetails, _) {
//                   return Text(
//                     'Hello ${accountDetails.firstName}',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.account_circle),
//               title: Text('My Profile'),
//               onTap: () {
//                 // Navigate to My Account screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MyAccountScreen(),
//                   ),
//                 );
//               },
//             ),
//             // Other list tile items...
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text('Home Page'),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: ValueListenableBuilder<String>(
                valueListenable: Provider.of<AccountDetails>(context).firstNameNotifier,
                builder: (context, firstName, _) {
                  return Text(
                    'Hello $firstName',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  );
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('My Profile'),
              onTap: () {
                // Navigate to My Account screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyAccountScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('Hostel'),
              onTap: () {
                // Navigate to Hostel screen
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feedback'),
              onTap: () {
                // Navigate to Feedback screen
              },
            ),
            ListTile(
              leading: Icon(Icons.menu),
              title: Text('Menu Section'),
              onTap: () {
                // Navigate to Menu Section screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyMenuScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Validity'),
              onTap: () {
                // Navigate to Validity screen
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Order History'),
              onTap: () {
                // Navigate to Order History screen
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share App'),
              onTap: () {
                // Share the app
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Wallet'),
              onTap: () {
                // Navigate to Wallet screen
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                // Perform logout action
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}


// class MyAccountScreen extends StatefulWidget {
//   @override
//   _MyAccountScreenState createState() => _MyAccountScreenState();
// }
//
// class _MyAccountScreenState extends State<MyAccountScreen> {
//   bool _isEditing = false;
//   late TextEditingController _firstNameController;
//   late TextEditingController _lastNameController;
//   late TextEditingController _emailController;
//   late TextEditingController _mobileController;
//
//   Future<void> reloadData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     Provider.of<AccountDetails>(context, listen: false).updateFirstName(prefs.getString('firstName') ?? '');
//     Provider.of<AccountDetails>(context, listen: false).updateLastName(prefs.getString('lastName') ?? '');
//     Provider.of<AccountDetails>(context, listen: false).updateEmail(prefs.getString('email') ?? '');
//     Provider.of<AccountDetails>(context, listen: false).updateMobile(prefs.getString('mobile') ?? '');
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _firstNameController = TextEditingController();
//     _lastNameController = TextEditingController();
//     _emailController = TextEditingController();
//     _mobileController = TextEditingController();
//     loadData(context);
//   }
//
//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _mobileController.dispose();
//     super.dispose();
//   }
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
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Consumer<AccountDetails>(
//           builder: (context, accountDetails, child) {
//             _firstNameController.text = accountDetails.firstName;
//             _lastNameController.text = accountDetails.lastName;
//             _emailController.text = accountDetails.email;
//             _mobileController.text = accountDetails.mobile;
//
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // GestureDetector(
//                 //   onTap: () {
//                 //     // Show dialog or navigate to screen for changing profile picture
//                 //     // Example:
//                 //     showDialog(
//                 //       context: context,
//                 //       builder: (context) {
//                 //         return AlertDialog(
//                 //           title: Text('Change Profile Picture'),
//                 //           content: Text('Options for changing profile picture go here.'),
//                 //           actions: [
//                 //             TextButton(
//                 //               onPressed: () {
//                 //                 Navigator.pop(context);
//                 //               },
//                 //               child: Text('Cancel'),
//                 //             ),
//                 //           ],
//                 //         );
//                 //       },
//                 //     );
//                 //   },
//                 //   child: CircleAvatar(
//                 //     radius: 50,
//                 //     // Change this to your profile picture
//                 //     backgroundImage: AssetImage('assets/profile_pic.png'),
//                 //   ),
//                 // ),
//                 // GestureDetector(
//                 //   onTap: () {
//                 //     // Show dialog or navigate to screen for changing profile picture
//                 //     // Example:
//                 //     showDialog(
//                 //       context: context,
//                 //       builder: (context) {
//                 //         return AlertDialog(
//                 //           title: Text('Change Profile Picture'),
//                 //           content: Text('Options for changing profile picture go here.'),
//                 //           actions: [
//                 //             TextButton(
//                 //               onPressed: () {
//                 //                 // Implement logic to change profile picture
//                 //                 Navigator.pop(context);
//                 //               },
//                 //               child: Text('Choose from gallery'),
//                 //             ),
//                 //             TextButton(
//                 //               onPressed: () {
//                 //                 // Implement logic to capture new profile picture
//                 //                 Navigator.pop(context);
//                 //               },
//                 //               child: Text('Take a photo'),
//                 //             ),
//                 //           ],
//                 //         );
//                 //       },
//                 //     );
//                 //   },
//                 //   child: CircleAvatar(
//                 //     radius: 50,
//                 //     // Change this to your profile picture
//                 //     backgroundImage: AssetImage('assets/profile_pic.png'),
//                 //   ),
//                 // ),
//
//
//             GestureDetector(
//             onTap: () async {
//               // Show dialog to choose between gallery and camera
//               final pickedFile = await showDialog<File?>(
//                 context: context,
//                 builder: (context) => AlertDialog(
//                   title: Text('Change Profile Picture'),
//                   content: Text('Choose from gallery or take a photo:'),
//                   actions: [
//                     TextButton(
//                       onPressed: () async {
//                         // Pick image from gallery
//                         final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//                         Navigator.pop(context, pickedImage != null ? File(pickedImage.path) : null);
//                       },
//                       child: Text('Choose from gallery'),
//                     ),
//                     TextButton(
//                       onPressed: () async {
//                         // Take a photo with camera
//                         final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
//                         Navigator.pop(context, pickedImage != null ? File(pickedImage.path) : null);
//                       },
//                       child: Text('Take a photo'),
//                     ),
//                   ],
//                 ),
//               );
//
//               if (pickedFile != null) {
//                 // Handle picked file, upload it, etc.
//               }
//             },
//             child: CircleAvatar(
//             radius: 50,
//             // Change this to your profile picture
//             backgroundImage: AssetImage('assets/profile_pic.png'),
//             ),
//             ),
//
//             SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'My Info',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     if (_isEditing)
//                       ElevatedButton(
//                         onPressed: () {
//                           accountDetails.updateFirstName(_firstNameController.text);
//                           accountDetails.updateLastName(_lastNameController.text);
//                           accountDetails.updateEmail(_emailController.text);
//                           accountDetails.updateMobile(_mobileController.text);
//                           setState(() {
//                             _isEditing = false;
//                           });
//                         },
//                         child: Text('Done'),
//                       ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   controller: _firstNameController,
//                   decoration: InputDecoration(
//                     labelText: 'First Name',
//                     border: OutlineInputBorder(),
//                   ),
//                   enabled: _isEditing,
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   controller: _lastNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Last Name',
//                     border: OutlineInputBorder(),
//                   ),
//                   enabled: _isEditing,
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   enabled: _isEditing,
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   controller: _mobileController,
//                   decoration: InputDecoration(
//                     labelText: 'Mobile',
//                     border: OutlineInputBorder(),
//                   ),
//                   enabled: _isEditing,
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  bool _isEditing = false;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _mobileController;
  File? _selectedImage; // Variable to store the selected image

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _mobileController = TextEditingController();
    loadData(context);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AccountDetails>(
          builder: (context, accountDetails, child) {
            _firstNameController.text = accountDetails.firstName;
            _lastNameController.text = accountDetails.lastName;
            _emailController.text = accountDetails.email;
            _mobileController.text = accountDetails.mobile;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async {
                    // Show dialog to choose between gallery and camera
                    final pickedFile = await showDialog<File?>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Change Profile Picture'),
                        content: Text('Choose from gallery or take a photo:'),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              // Pick image from gallery
                              final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                              Navigator.pop(context, pickedImage != null ? File(pickedImage.path) : null);
                            },
                            child: Text('Choose from gallery'),
                          ),
                          TextButton(
                            onPressed: () async {
                              // Take a photo with camera
                              final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
                              Navigator.pop(context, pickedImage != null ? File(pickedImage.path) : null);
                            },
                            child: Text('Take a photo'),
                          ),
                        ],
                      ),
                    );

                    if (pickedFile != null) {
                      setState(() {
                        _selectedImage = pickedFile; // Update selected image
                      });
                    }
                  },
                  child: CircleAvatar(
                    radius: 50,
                    // Change this to your profile picture
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!) // Display selected image if available
                        : AssetImage('assets/usericon.png') as ImageProvider<Object>, // Default profile picture
                  ),
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
                          accountDetails.updateFirstName(_firstNameController.text);
                          accountDetails.updateLastName(_lastNameController.text);
                          accountDetails.updateEmail(_emailController.text);
                          accountDetails.updateMobile(_mobileController.text);
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
              ],
            );
          },
        ),
      ),
    );
  }
}



