import 'package:flutter/material.dart';

import 'package:hamburger/mess_hostel_selection.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hostel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: HostelPage1(),
    );
  }
}

class HostelPage1 extends StatefulWidget {
  @override
  _HostelPageState createState() => _HostelPageState();
}

class _HostelPageState extends State<HostelPage1> {
  String _name = 'John Doe'; // Default name
  String _email = 'example@example.com'; // Default email
  String _hostelResidence = 'Hostel Name'; // Default hostel residence
  String _yearOfStudy = '1st Year'; // Default year of study
  String _phoneNumber = '123-456-7890'; // Default phone number

  int _currentIndex = 0;

  List<Complaint> _complaints = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hostel'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
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
            ListTile(
              title: Text('Complaints'),
              leading: Icon(Icons.report),
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: _currentIndex == 2 ? _buildComplaintsPage() : _buildPageContent(),
      floatingActionButton: _currentIndex == 2
          ? FloatingActionButton(
        onPressed: () {
          _showCreateComplaintDialog(context);
        },
        child: Icon(Icons.add),
      )
          : null,
    );
  }

  Widget _buildComplaintsPage() {
    return ListView.builder(
      itemCount: _complaints.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 4,
          child: ListTile(
            title: Text(
              _complaints[index].problem,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  'Room Number: ${_complaints[index].roomNumber}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Hostel Name: ${_complaints[index].hostelName}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Category: ${_complaints[index].category}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Status: ${_complaints[index].status}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    setState(() {
                      _complaints[index].status = 'Solved';
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.pending),
                  onPressed: () {
                    setState(() {
                      _complaints[index].status = 'Pending';
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _complaints.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPageContent() {
    // Replace this with your logic for displaying different pages based on the current index
    return Container(
      child: Center(
        child: Text('Page content goes here'),
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

  void _showCreateComplaintDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String complaint = '';
        String roomNumber = '';
        String hostelName = '';
        String category = 'Electricity';

        return AlertDialog(
          title: Text('Create Complaint'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField(
                value: category,
                onChanged: (value) {
                  setState(() {
                    category = value.toString();
                  });
                },
                items: ['Electricity', 'Water', 'Pest', 'Plumber']
                    .map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Room Number'),
                onChanged: (value) {
                  roomNumber = value;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Hostel Name'),
                onChanged: (value) {
                  hostelName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Enter your complaint'),
                onChanged: (value) {
                  complaint = value;
                },
              ),
            ],
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
                _addComplaint(complaint, roomNumber, hostelName, category);
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _addComplaint(String problem, String roomNumber, String hostelName, String category) {
    setState(() {
      _complaints.add(Complaint(
        problem: problem,
        roomNumber: roomNumber,
        hostelName: hostelName,
        category: category,
        status: 'Pending',
      ));
    });
  }
}

class Complaint {
  String problem;
  String roomNumber;
  String hostelName;
  String category;
  String status;

  Complaint({required this.problem, required this.roomNumber, required this.hostelName, required this.category, required this.status});
}