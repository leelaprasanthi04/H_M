import 'package:flutter/material.dart';
import 'package:hamburger/mess_hostel_selection.dart';
import 'package:hamburger/addcomplaintpage.dart';
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
      home: HostelPage(),
    );
  }
}

class HostelPage extends StatefulWidget {
  @override
  _HostelPageState createState() => _HostelPageState();
}

class _HostelPageState extends State<HostelPage> {
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
        title: Text('HostelPage1'),

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
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });

                // Navigate to My Account screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
                // Close the drawer
              },
            ),
            ListTile(
              title: Text('Announcements'),
              leading: Icon(Icons.notifications),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            // ListTile(
            //   title: Text('Other Page 2'),
            //   leading: Icon(Icons.info),
            //   onTap: () {
            //     setState(() {
            //       _currentIndex = 2;
            //     });
            //     Navigator.pop(context); // Close the drawer
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.menu),
              title: Text('Complaints Section'),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                // Navigate to Menu Section screen
                Navigator.pop(context); // Pop the current screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ComplaintsPage()),
                );

              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
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

