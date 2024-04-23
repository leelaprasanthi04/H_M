// //
// // import 'package:flutter/material.dart';
// //
// //
// // import 'package:login_signup/login.dart';
// // import 'package:login_signup/signup.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Home Page'),
// //         ),
// //         body: const HomePage(),
// //       ),
// //     );
// //   }
// // }
// //
// // class HomePage extends StatelessWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Container(
// //
// //           width: double.infinity,
// //           height: MediaQuery.of(context).size.height,
// //           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
// //           child: Column(
// //             // even space distribution
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: <Widget>[
// //               Column(
// //                 children: <Widget>[
// //                   const Text(
// //                     "Welcome",
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 30,
// //
// //                     ),
// //
// //                   ),
// //                   const SizedBox(
// //                     height: 20,
// //                   ),
// //                   Text("Mess and Hostel Management! ",
// //                     textAlign: TextAlign.center,
// //                     style: TextStyle(
// //                       color: Colors.grey[700],
// //                       fontSize: 15,
// //
// //                     ),)
// //                 ],
// //               ),
// //               Container(
// //                 height: MediaQuery.of(context).size.height / 3,
// //                 decoration: const BoxDecoration(
// //                     image: DecorationImage(
// //                         image: AssetImage("assets/welcome.png")
// //                     )
// //                 ),
// //               ),
// //
// //               Column(
// //                 children: <Widget>[
// //                   // the login button
// //                   MaterialButton(
// //                     minWidth: double.infinity,
// //                     height: 60,
// //                     onPressed: () {
// //                       Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
// //
// //                     },
// //                     // defining the shape
// //                     shape: RoundedRectangleBorder(
// //                         side: const BorderSide(
// //                             color: Colors.black
// //                         ),
// //                         borderRadius: BorderRadius.circular(50)
// //                     ),
// //                     child: const Text(
// //                       "Login",
// //                       style: TextStyle(
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 18
// //                       ),
// //                     ),
// //                   ),
// //                   // creating the signup button
// //                   const SizedBox(height:20),
// //                   MaterialButton(
// //                     minWidth: double.infinity,
// //                     height: 60,
// //                     onPressed: (){
// //                       Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignupPage()));
// //
// //                     },
// //                     color: const Color(0xff0095FF),
// //                     shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(50)
// //                     ),
// //                     child: const Text(
// //                       "Sign up",
// //                       style: TextStyle(
// //                           color: Colors.white,
// //                           fontWeight: FontWeight.w600,
// //                           fontSize: 18
// //                       ),
// //                     ),
// //                   )
// //
// //                 ],
// //               )
// //
// //
// //
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
//
import 'package:flutter/material.dart';
import 'package:hamburger/login.dart';

void main()  {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}




//
// import 'package:flutter/material.dart';
// import 'package:hamburger/validity.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:hamburger/hamburger/menupage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:carousel_slider/carousel_slider.dart'; // Import the carousel_slider package
// import 'package:hamburger/messpage2.dart';
// import 'package:hamburger/paymentpage.dart';
// import 'package:hamburger/hostelpage1.dart';
// import 'package:hamburger/feedbackpage.dart';
// import 'package:hamburger/validity.dart';
//
// class AccountDetails extends ChangeNotifier {
//   ValueNotifier<String> _firstNameNotifier = ValueNotifier<String>('John');
//   ValueNotifier<String> get firstNameNotifier => _firstNameNotifier;
//
//   String get firstName => _firstNameNotifier.value;
//
//   ValueNotifier<String> _lastNameNotifier = ValueNotifier<String>('Kevis');
//   ValueNotifier<String> get lastNameNotifier => _lastNameNotifier;
//
//   String get lastName => _lastNameNotifier.value;
//
//   ValueNotifier<String> _mobileNotifier = ValueNotifier<String>('Kevis');
//   ValueNotifier<String> get mobileNotifier => _mobileNotifier;
//
//   String get mobile => _mobileNotifier.value;
//
//   ValueNotifier<String> _emailNotifier = ValueNotifier<String>('Kevis');
//   ValueNotifier<String> get emailNotifier => _emailNotifier;
//
//   String get email => _emailNotifier.value;
//
//   Future<void> saveData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('firstName', _firstNameNotifier.value);
//     prefs.setString('lastName', _lastNameNotifier.value);
//     prefs.setString('email', _emailNotifier.value);
//     prefs.setString('mobile', _mobileNotifier.value);
//   }
//
//   // Update the first name and notify listeners
//   void updateFirstName(String newFirstName) {
//     _firstNameNotifier.value = newFirstName;
//     saveData();
//     notifyListeners();
//   }
//
//   void updateLastName(String newLastName) {
//     _lastNameNotifier.value = newLastName;
//     saveData();
//     notifyListeners();
//   }
//
//   void updateEmail(String newEmail) {
//     _emailNotifier.value = newEmail;
//     saveData();
//     notifyListeners();
//   }
//
//   void updateMobile(String newMobile) {
//     _mobileNotifier.value = newMobile;
//     saveData();
//     notifyListeners();
//   }
//
// // Other methods...
// }
//
// void main() async {
//   // Load data from SharedPreferences
//   runApp(MyApp());
// }
//
//
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: loadData(context),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return ChangeNotifierProvider(
//             create: (context) => AccountDetails(),
//             child: MaterialApp(
//               title: 'Your App',
//               debugShowCheckedModeBanner: false,
//               theme: ThemeData(
//                 primarySwatch: Colors.blue,
//               ),
//               home: HomePage(),
//             ),
//           );
//         } else {
//           return CircularProgressIndicator(); // Or any loading indicator
//         }
//       },
//     );
//   }
// }
//
// Future<void> loadData(BuildContext context) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var accountDetails = Provider.of<AccountDetails>(context, listen: false);
//   accountDetails.updateFirstName(prefs.getString('firstName') ?? '');
//   accountDetails.updateLastName(prefs.getString('lastName') ?? '');
//   accountDetails.updateEmail(prefs.getString('email') ?? '');
//   accountDetails.updateMobile(prefs.getString('mobile') ?? '');
// }
//
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Your App'),
// //       ),
// //       drawer: Drawer(
// //         child: ListView(
// //           padding: EdgeInsets.zero,
// //           children: <Widget>[
// //             DrawerHeader(
// //               decoration: BoxDecoration(
// //                 color: Colors.blue,
// //               ),
// //               child: Consumer<AccountDetails>(
// //                 builder: (context, accountDetails, _) {
// //                   return Text(
// //                     'Hello ${accountDetails.firstName}',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 24,
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //             ListTile(
// //               leading: Icon(Icons.account_circle),
// //               title: Text('My Profile'),
// //               onTap: () {
// //                 // Navigate to My Account screen
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => MyAccountScreen(),
// //                   ),
// //                 );
// //               },
// //             ),
// //             // Other list tile items...
// //           ],
// //         ),
// //       ),
// //       body: Center(
// //         child: Text('Home Page'),
// //       ),
// //     );
// //   }
// // }
//
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Your App'),
// //       ),
// //       drawer: Drawer(
// //         child: ListView(
// //           padding: EdgeInsets.zero,
// //           children: <Widget>[
// //             DrawerHeader(
// //               decoration: BoxDecoration(
// //                 color: Colors.blue,
// //               ),
// //               child: Consumer<AccountDetails>(
// //                 builder: (context, accountDetails, _) {
// //                   return Text(
// //                     'Hello ${accountDetails.firstName}',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 24,
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //             ListTile(
// //               leading: Icon(Icons.account_circle),
// //               title: Text('My Profile'),
// //               onTap: () {
// //                 // Navigate to My Account screen
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => MyAccountScreen(),
// //                   ),
// //                 );
// //               },
// //             ),
// //             // Other list tile items...
// //           ],
// //         ),
// //       ),
// //       body: Center(
// //         child: Text('Home Page'),
// //       ),
// //     );
// //   }
// // }
//
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
//               child: ValueListenableBuilder<String>(
//                 valueListenable: Provider.of<AccountDetails>(context).firstNameNotifier,
//                 builder: (context, firstName, _) {
//                   return Text(
//                     'Hello $firstName',
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
//             ListTile(
//               leading: Icon(Icons.business),
//               title: Text('Hostel'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HostelPage()),
//                 );
//                 // Navigate to Hostel screen
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.feedback),
//               title: Text('Feedback'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyMenuScreen1()),
//                 );
//                 // Navigate to Feedback screen
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.menu),
//               title: Text('Menu Section'),
//               onTap: () {
//                 // Navigate to Menu Section screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyMenuScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.calendar_today),
//               title: Text('Validity'),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SubscriptionScreen()),
//                 );
//                 // Navigate to Validity screen
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.history),
//               title: Text('Order History'),
//               onTap: () {
//                 // Navigate to Order History screen
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.share),
//               title: Text('Share App'),
//               onTap: () {
//                 // Share the app
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.account_balance_wallet),
//               title: Text('Wallet'),
//               onTap: () {
//                 // Navigate to Wallet screen
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text('Logout'),
//               onTap: () {
//                 // Perform logout action
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 500,
//               height: 100,
//               child: CarouselSlider(
//                 items: [
//                   // You can add carousel items here
//                   Image.asset(
//                     'assets/welcome.png', // Replace 'assets/image1.jpg' with your asset image path
//                     fit: BoxFit.cover,
//                   ),
//                   Image.asset(
//                     'assets/bg_logo.png', // Replace 'assets/image2.jpg' with your asset image path
//                     fit: BoxFit.cover,
//                   ),
//                   Image.asset(
//                     'assets/bg_logo.png', // Replace 'assets/image3.jpg' with your asset image path
//                     fit: BoxFit.cover,
//                   ),
//                 ],
//                 options: CarouselOptions(
//                   height: 200,
//                   aspectRatio: 16 / 9,
//                   viewportFraction: 0.8,
//                   initialPage: 0,
//                   enableInfiniteScroll: true,
//                   reverse: false,
//                   autoPlay: true,
//                   autoPlayInterval: const Duration(seconds: 3),
//                   autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                   autoPlayCurve: Curves.fastOutSlowIn,
//                   enlargeCenterPage: true,
//                   scrollDirection: Axis.horizontal,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 50),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(
//                   width: 300,
//                   height: 80,
//                   child: CustomButton(
//                     icon: Icons.hotel,
//                     text: "Subscription for Mess",
//                     additionalText: "Take your Subscription",
//                     onPressed: () {
//                       // Add your onPressed logic here
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => const RazorPayPage()));
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: 300,
//                   height: 80,
//                   child: CustomButton(
//                     icon: Icons.hotel,
//                     text: "Extras in Meal",
//                     additionalText: "Order at Extras counter",
//                     onPressed: () {
//                       // Add your onPressed logic here
//
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => const RazorPayPage()));
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: 300,
//                   height: 80,
//                   child: CustomButton(
//                     icon: Icons.hotel,
//
//                     text: "Order at Mess",
//                     additionalText: "Order your Meal",
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage()));
//                       print("Remove button pressed");
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// // class MyAccountScreen extends StatefulWidget {
// //   @override
// //   _MyAccountScreenState createState() => _MyAccountScreenState();
// // }
// //
// // class _MyAccountScreenState extends State<MyAccountScreen> {
// //   bool _isEditing = false;
// //   late TextEditingController _firstNameController;
// //   late TextEditingController _lastNameController;
// //   late TextEditingController _emailController;
// //   late TextEditingController _mobileController;
// //
// //   Future<void> reloadData() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     Provider.of<AccountDetails>(context, listen: false).updateFirstName(prefs.getString('firstName') ?? '');
// //     Provider.of<AccountDetails>(context, listen: false).updateLastName(prefs.getString('lastName') ?? '');
// //     Provider.of<AccountDetails>(context, listen: false).updateEmail(prefs.getString('email') ?? '');
// //     Provider.of<AccountDetails>(context, listen: false).updateMobile(prefs.getString('mobile') ?? '');
// //   }
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _firstNameController = TextEditingController();
// //     _lastNameController = TextEditingController();
// //     _emailController = TextEditingController();
// //     _mobileController = TextEditingController();
// //     loadData(context);
// //   }
// //
// //   @override
// //   void dispose() {
// //     _firstNameController.dispose();
// //     _lastNameController.dispose();
// //     _emailController.dispose();
// //     _mobileController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('My Account'),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.edit),
// //             onPressed: () {
// //               setState(() {
// //                 _isEditing = !_isEditing;
// //               });
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Consumer<AccountDetails>(
// //           builder: (context, accountDetails, child) {
// //             _firstNameController.text = accountDetails.firstName;
// //             _lastNameController.text = accountDetails.lastName;
// //             _emailController.text = accountDetails.email;
// //             _mobileController.text = accountDetails.mobile;
// //
// //             return Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // GestureDetector(
// //                 //   onTap: () {
// //                 //     // Show dialog or navigate to screen for changing profile picture
// //                 //     // Example:
// //                 //     showDialog(
// //                 //       context: context,
// //                 //       builder: (context) {
// //                 //         return AlertDialog(
// //                 //           title: Text('Change Profile Picture'),
// //                 //           content: Text('Options for changing profile picture go here.'),
// //                 //           actions: [
// //                 //             TextButton(
// //                 //               onPressed: () {
// //                 //                 Navigator.pop(context);
// //                 //               },
// //                 //               child: Text('Cancel'),
// //                 //             ),
// //                 //           ],
// //                 //         );
// //                 //       },
// //                 //     );
// //                 //   },
// //                 //   child: CircleAvatar(
// //                 //     radius: 50,
// //                 //     // Change this to your profile picture
// //                 //     backgroundImage: AssetImage('assets/profile_pic.png'),
// //                 //   ),
// //                 // ),
// //                 // GestureDetector(
// //                 //   onTap: () {
// //                 //     // Show dialog or navigate to screen for changing profile picture
// //                 //     // Example:
// //                 //     showDialog(
// //                 //       context: context,
// //                 //       builder: (context) {
// //                 //         return AlertDialog(
// //                 //           title: Text('Change Profile Picture'),
// //                 //           content: Text('Options for changing profile picture go here.'),
// //                 //           actions: [
// //                 //             TextButton(
// //                 //               onPressed: () {
// //                 //                 // Implement logic to change profile picture
// //                 //                 Navigator.pop(context);
// //                 //               },
// //                 //               child: Text('Choose from gallery'),
// //                 //             ),
// //                 //             TextButton(
// //                 //               onPressed: () {
// //                 //                 // Implement logic to capture new profile picture
// //                 //                 Navigator.pop(context);
// //                 //               },
// //                 //               child: Text('Take a photo'),
// //                 //             ),
// //                 //           ],
// //                 //         );
// //                 //       },
// //                 //     );
// //                 //   },
// //                 //   child: CircleAvatar(
// //                 //     radius: 50,
// //                 //     // Change this to your profile picture
// //                 //     backgroundImage: AssetImage('assets/profile_pic.png'),
// //                 //   ),
// //                 // ),
// //
// //
// //             GestureDetector(
// //             onTap: () async {
// //               // Show dialog to choose between gallery and camera
// //               final pickedFile = await showDialog<File?>(
// //                 context: context,
// //                 builder: (context) => AlertDialog(
// //                   title: Text('Change Profile Picture'),
// //                   content: Text('Choose from gallery or take a photo:'),
// //                   actions: [
// //                     TextButton(
// //                       onPressed: () async {
// //                         // Pick image from gallery
// //                         final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
// //                         Navigator.pop(context, pickedImage != null ? File(pickedImage.path) : null);
// //                       },
// //                       child: Text('Choose from gallery'),
// //                     ),
// //                     TextButton(
// //                       onPressed: () async {
// //                         // Take a photo with camera
// //                         final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
// //                         Navigator.pop(context, pickedImage != null ? File(pickedImage.path) : null);
// //                       },
// //                       child: Text('Take a photo'),
// //                     ),
// //                   ],
// //                 ),
// //               );
// //
// //               if (pickedFile != null) {
// //                 // Handle picked file, upload it, etc.
// //               }
// //             },
// //             child: CircleAvatar(
// //             radius: 50,
// //             // Change this to your profile picture
// //             backgroundImage: AssetImage('assets/profile_pic.png'),
// //             ),
// //             ),
// //
// //             SizedBox(height: 20),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       'My Info',
// //                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                     ),
// //                     if (_isEditing)
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           accountDetails.updateFirstName(_firstNameController.text);
// //                           accountDetails.updateLastName(_lastNameController.text);
// //                           accountDetails.updateEmail(_emailController.text);
// //                           accountDetails.updateMobile(_mobileController.text);
// //                           setState(() {
// //                             _isEditing = false;
// //                           });
// //                         },
// //                         child: Text('Done'),
// //                       ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 10),
// //                 TextFormField(
// //                   controller: _firstNameController,
// //                   decoration: InputDecoration(
// //                     labelText: 'First Name',
// //                     border: OutlineInputBorder(),
// //                   ),
// //                   enabled: _isEditing,
// //                 ),
// //                 SizedBox(height: 10),
// //                 TextFormField(
// //                   controller: _lastNameController,
// //                   decoration: InputDecoration(
// //                     labelText: 'Last Name',
// //                     border: OutlineInputBorder(),
// //                   ),
// //                   enabled: _isEditing,
// //                 ),
// //                 SizedBox(height: 10),
// //                 TextFormField(
// //                   controller: _emailController,
// //                   decoration: InputDecoration(
// //                     labelText: 'Email',
// //                     border: OutlineInputBorder(),
// //                   ),
// //                   enabled: _isEditing,
// //                 ),
// //                 SizedBox(height: 10),
// //                 TextFormField(
// //                   controller: _mobileController,
// //                   decoration: InputDecoration(
// //                     labelText: 'Mobile',
// //                     border: OutlineInputBorder(),
// //                   ),
// //                   enabled: _isEditing,
// //                 ),
// //               ],
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
//
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
//   File? _selectedImage; // Variable to store the selected image
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
//                 GestureDetector(
//                   onTap: () async {
//                     // Show dialog to choose between gallery and camera
//                     final pickedFile = await showDialog<File?>(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         title: Text('Change Profile Picture'),
//                         content: Text('Choose from gallery or take a photo:'),
//                         actions: [
//                           TextButton(
//                             onPressed: () async {
//                               // Pick image from gallery
//                               final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//                               Navigator.pop(context, pickedImage != null ? File(pickedImage.path) : null);
//                             },
//                             child: Text('Choose from gallery'),
//                           ),
//                           TextButton(
//                             onPressed: () async {
//                               // Take a photo with camera
//                               final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
//                               Navigator.pop(context, pickedImage != null ? File(pickedImage.path) : null);
//                             },
//                             child: Text('Take a photo'),
//                           ),
//                         ],
//                       ),
//                     );
//
//                     if (pickedFile != null) {
//                       setState(() {
//                         _selectedImage = pickedFile; // Update selected image
//                       });
//                     }
//                   },
//                   child: CircleAvatar(
//                     radius: 50,
//                     // Change this to your profile picture
//                     backgroundImage: _selectedImage != null
//                         ? FileImage(_selectedImage!) // Display selected image if available
//                         : AssetImage('assets/usericon.png') as ImageProvider<Object>, // Default profile picture
//                   ),
//                 ),
//                 SizedBox(height: 20),
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
//
// class CustomButton extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final String additionalText;
//   final VoidCallback onPressed;
//
//   const CustomButton({super.key,
//     required this.icon,
//     required this.text,
//     required this.additionalText,
//     required this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Icon(
//             icon,
//             size: 36, // Set the icon size
//           ),
//           const SizedBox(width: 20), // Adjust the spacing between icon and text
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 width: 180,
//
//                 child: Text(
//                   text,
//                   style: const TextStyle(
//                     fontSize: 18, // Set the font size
//                     fontWeight: FontWeight.bold, // Set the font weight
//                   ),
//                 ),
//
//               ),
//               const SizedBox(height: 8),
//               SizedBox(
//                 width: 180,
//                 child: Text(
//                   additionalText,
//                   style: const TextStyle(
//                     fontSize: 14, // Set the font size for additional text
//                     color: Colors.white, // Customize the color if needed
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//         ],
//       ),
//     );
//   }
// }
