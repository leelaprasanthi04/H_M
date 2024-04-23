// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart'; // Import the carousel_slider package
// import 'package:hamburger/messpage2.dart';
// import 'package:hamburger/paymentpage.dart';
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MessPage1(),
//     );
//   }
// }
//
//
// class MessPage1 extends StatelessWidget {
//   const MessPage1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Mess Page 1"),
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
//                       print("Remove button pressed");
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


import 'package:flutter/material.dart';
import 'package:hamburger/login.dart';
import 'package:hamburger/validity.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hamburger/hamburger/menupage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart'; // Import the carousel_slider package
import 'package:hamburger/messpage2.dart';
import 'package:hamburger/paymentpage.dart';
import 'package:hamburger/hostelpage1.dart';
import 'package:hamburger/feedbackpage.dart';

import 'package:hamburger/login.dart';
import 'package:hamburger/paymentnewpage.dart';
import 'package:hamburger/validity.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hostel Page1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: MessPage(),
    );
  }
}

class MessPage extends StatefulWidget {
  @override
  _HostelPageState createState() => _HostelPageState();
}

class _HostelPageState extends State<MessPage> {
  String _name = 'Sushma'; // Default name
  String _email = 'gs21ecb0a15@student.nitw.ac.in'; // Default email
  String _hostelResidence = 'New LH'; // Default hostel residence
  String _yearOfStudy = '3rd Year'; // Default year of study
  String _phoneNumber = '123-456-7890'; // Default phone number

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HostelDetailsPage(),
    AnnouncementsPage(),
    OtherPage(title: 'Other Page 2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(''),
        backgroundColor: Colors.blue[100],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(_name),
              accountEmail: Text(_email),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.account_circle, size: 48.0),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.account_circle),
              onTap: () {

                Navigator.pop(context); // Close the drawer
                _showMyAccountDialog(context);
              },
            ),
            // Divider(),


            ListTile(
              leading: Icon(Icons.business),
              title: Text('Hostel'),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HostelPage()),
                );
                // Navigate to Hostel screen
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feedback'),
              onTap: () {

                setState(() {
                  _currentIndex = 2;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyMenuScreen1()),
                );// Navigate to Feedback screen
              },
            ),
            ListTile(
              leading: Icon(Icons.menu),
              title: Text('Menu Section'),
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyMenuScreen()),
                );
                // Navigate to Menu Section screen
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MyMenuScreen()),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Validity'),
              onTap: () {
                setState(() {
                  _currentIndex = 4;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubscriptionScreen()),
                );
                // Navigate to Validity screen
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Order History'),
              onTap: () {
                setState(() {
                  _currentIndex = 5;
                });
                // Navigate to Order History screen
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share App'),
              onTap: () {
                setState(() {
                  _currentIndex = 6;
                });
                // Share the app
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Wallet'),
              onTap: () {
                setState(() {
                  _currentIndex = 7;
                });
                // Navigate to Wallet screen
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                setState(() {
                  _currentIndex = 8;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                // Perform logout action
              },
            ),


          ],
        ),
      ),
      backgroundColor: Colors.blue[100],
      body:

      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              height: 100,
              child: CarouselSlider(
                items: [
                  // You can add carousel items here
                  Image.asset(
                    'assets/welcome.png', // Replace 'assets/image1.jpg' with your asset image path
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/welcome.png', // Replace 'assets/image2.jpg' with your asset image path
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/welcome.png', // Replace 'assets/image3.jpg' with your asset image path
                    fit: BoxFit.cover,
                  ),
                ],
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 300,
                  height: 80,
                  child: CustomButton(
                    icon: Icons.set_meal,
                    text: "Subscription for Mess",
                    additionalText: "Take your Subscription",
                    onPressed: () {
                      // Add your onPressed logic here
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RazorPayPagenew()));
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  height: 80,
                  child: CustomButton(
                    icon: Icons.hotel,
                    text: "Extras in Meal",
                    additionalText: "Order at Extras counter",
                    onPressed: () {
                      // Add your onPressed logic here
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RazorPayPage()));
                      print("Remove button pressed");
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  height: 80,
                  child: CustomButton(
                    icon: Icons.hotel,

                    text: "Order at Mess",
                    additionalText: "Order your Meal",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage()));
                      print("Remove button pressed");
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showMyAccountDialog(BuildContext context) {
    String editedName = _name;
    String editedEmail = _email;
    String editedHostelResidence = _hostelResidence;
    String editedYearOfStudy = _yearOfStudy;
    String editedPhoneNumber = _phoneNumber;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Edit My Account'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Name'),
                      onChanged: (value) => editedName = value,
                      controller: TextEditingController(text: editedName),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onChanged: (value) => editedEmail = value,
                      controller: TextEditingController(text: editedEmail),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Hostel Residence'),
                      onChanged: (value) => editedHostelResidence = value,
                      controller: TextEditingController(text: editedHostelResidence),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Year of Study'),
                      onChanged: (value) => editedYearOfStudy = value,
                      controller: TextEditingController(text: editedYearOfStudy),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      onChanged: (value) => editedPhoneNumber = value,
                      controller: TextEditingController(text: editedPhoneNumber),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _name = editedName;
                      _email = editedEmail;
                      _hostelResidence = editedHostelResidence;
                      _yearOfStudy = editedYearOfStudy;
                      _phoneNumber = editedPhoneNumber;
                    });
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class HostelDetailsPage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact('Electricity', '123-456-7890'),
    Contact('Plumber', '234-567-8901'),
    Contact('Pest Control', '345-678-9012'),
    Contact('Carpenter', '456-789-0123'),
    Contact('Mess Representative 1', '567-890-1234'),
    Contact('Mess Representative 2', '678-901-2345'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 4,
          child: ListTile(
            title: Text(
              contacts[index].name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              contacts[index].phoneNumber,
              style: TextStyle(fontSize: 16),
            ),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}

class AnnouncementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        AnnouncementCard(
          title: 'Power Cut on Sunday',
          notificationType: 'Info',
        ),
        AnnouncementCard(
          title: 'Maintenance Work on Monday',
          notificationType: 'Alert',
        ),
        AnnouncementCard(
          title: 'Water Supply Disruption on Tuesday',
          notificationType: 'Warning',
        ),
        // Add more AnnouncementCard widgets for other announcements
      ],
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String notificationType;

  const AnnouncementCard({
    Key? key,
    required this.title,
    required this.notificationType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (notificationType) {
      case 'Alert':
        color = Colors.red;
        break;
      case 'Warning':
        color = Colors.orange;
        break;
      default:
        color = Colors.blue;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'Notification Type: $notificationType',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  final String title;

  const OtherPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;

  Contact(this.name, this.phoneNumber);
}

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

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final String additionalText;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.additionalText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Set light blue as button background color
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Increase padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 32,
              color: Colors.white, // Set icon color to white
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  additionalText,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
