import 'package:flutter/material.dart';

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
      home: ComplaintsPage(),
    );
  }
}

class ComplaintsPage extends StatefulWidget {
  @override
  _ComplaintsPageState createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  int _currentIndex = 0;

  List<Complaint> _complaints = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaints Page'),
      ),
      // body: _currentIndex == 2 ? _buildComplaintsPage() : _buildPageContent(),
      // floatingActionButton: _currentIndex == 2
      //     ? FloatingActionButton(
      //   onPressed: () {
      //     _showCreateComplaintDialog(context);
      //   },
      //   child: Icon(Icons.add),
      // )
      //     : null,
      body: _buildComplaintsPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateComplaintDialog(context);
        },
        child: Icon(Icons.add),
      ),

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
    return Container(
      child: Center(
        child: Text('Page content goes here'),
      ),
    );
  }

  // void _showCreateComplaintDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       String complaint = '';
  //       String roomNumber = '';
  //       String hostelName = '';
  //       String category = 'Electricity';
  //
  //       return AlertDialog(
  //         title: Text('Create Complaint'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             DropdownButtonFormField(
  //               value: category,
  //               onChanged: (value) {
  //                 setState(() {
  //                   category = value.toString();
  //                 });
  //               },
  //               items: ['Electricity', 'Water', 'Pest', 'Plumber']
  //                   .map((String value) {
  //                 return DropdownMenuItem(
  //                   value: value,
  //                   child: Text(value),
  //                 );
  //               }).toList(),
  //             ),
  //             TextField(
  //               decoration: InputDecoration(hintText: 'Room Number'),
  //               onChanged: (value) {
  //                 roomNumber = value;
  //               },
  //             ),
  //             TextField(
  //               decoration: InputDecoration(hintText: 'Hostel Name'),
  //               onChanged: (value) {
  //                 hostelName = value;
  //               },
  //             ),
  //             TextField(
  //               decoration: InputDecoration(hintText: 'Enter your complaint'),
  //               onChanged: (value) {
  //                 complaint = value;
  //               },
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               _addComplaint(complaint, roomNumber, hostelName, category);
  //               Navigator.pop(context); // Close the dialog
  //             },
  //             child: Text('Submit'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void _showCreateComplaintDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       String complaint = '';
  //       String roomNumber = '';
  //       String hostelName = '';
  //       String category = 'Electricity';
  //
  //       final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //
  //       return AlertDialog(
  //         title: Text('Create Complaint'),
  //         content: Form(
  //           key: _formKey,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               DropdownButtonFormField(
  //                 value: category,
  //                 onChanged: (value) {
  //                   setState(() {
  //                     category = value.toString();
  //                   });
  //                 },
  //                 items: ['Electricity', 'Water', 'Pest', 'Plumber']
  //                     .map((String value) {
  //                   return DropdownMenuItem(
  //                     value: value,
  //                     child: Text(value),
  //                   );
  //                 }).toList(),
  //               ),
  //               TextFormField(
  //                 decoration: InputDecoration(hintText: 'Room Number'),
  //                 onChanged: (value) {
  //                   roomNumber = value;
  //                 },
  //                 validator: (value) {
  //                   if (value.isEmpty) {
  //                     return 'Please enter room number';
  //                   }
  //                   return null;
  //                 },
  //               ),
  //               TextFormField(
  //                 decoration: InputDecoration(hintText: 'Hostel Name'),
  //                 onChanged: (value) {
  //                   hostelName = value;
  //                 },
  //                 validator: (value) {
  //                   if (value.isEmpty) {
  //                     return 'Please enter hostel name';
  //                   }
  //                   return null;
  //                 },
  //               ),
  //               TextFormField(
  //                 decoration: InputDecoration(hintText: 'Enter your complaint'),
  //                 onChanged: (value) {
  //                   complaint = value;
  //                 },
  //                 validator: (value) {
  //                   if (value.isEmpty) {
  //                     return 'Please enter complaint description';
  //                   }
  //                   return null;
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               if (_formKey.currentState!.validate()) {
  //                 _addComplaint(complaint, roomNumber, hostelName, category);
  //                 Navigator.pop(context); // Close the dialog
  //               }
  //             },
  //             child: Text('Submit'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  // void _showCreateComplaintDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       String complaint = '';
  //       String roomNumber = '';
  //       String hostelName = '';
  //       String category = 'Electricity';
  //
  //       final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //
  //       return AlertDialog(
  //         title: Text('Create Complaint'),
  //         content: SingleChildScrollView(
  //           child: Form(
  //             key: _formKey,
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 DropdownButtonFormField(
  //                   value: category,
  //                   onChanged: (value) {
  //                     setState(() {
  //                       category = value.toString();
  //                     });
  //                   },
  //                   items: ['Electricity', 'Water', 'Pest', 'Plumber']
  //                       .map((String value) {
  //                     return DropdownMenuItem(
  //                       value: value,
  //                       child: Text(value),
  //                     );
  //                   }).toList(),
  //                 ),
  //                 TextFormField(
  //                   decoration: InputDecoration(hintText: 'Room Number'),
  //                   onChanged: (value) {
  //                     roomNumber = value;
  //                   },
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return 'Please enter room number';
  //                     }
  //                     return null;
  //                   },
  //                 ),
  //                 TextFormField(
  //                   decoration: InputDecoration(hintText: 'Hostel Name'),
  //                   onChanged: (value) {
  //                     hostelName = value;
  //                   },
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return 'Please enter hostel name';
  //                     }
  //                     return null;
  //                   },
  //                 ),
  //                 TextFormField(
  //                   decoration: InputDecoration(hintText: 'Enter your complaint'),
  //                   onChanged: (value) {
  //                     complaint = value;
  //                   },
  //                   validator: (value) {
  //                     if (value == null || value.isEmpty) {
  //                       return 'Please enter complaint description';
  //                     }
  //                     return null;
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //             child: Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               if (_formKey.currentState!.validate()) {
  //                 _addComplaint(complaint, roomNumber, hostelName, category);
  //                 Navigator.pop(context); // Close the dialog
  //               }
  //             },
  //             child: Text('Submit'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void _showCreateComplaintDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String complaint = '';
        String roomNumber = '';
        String hostelName = 'NewLH A-Block'; // Default value
        String category = 'Electricity';

        final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

        return AlertDialog(
          title: Text('Create Complaint'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
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
                  DropdownButtonFormField(
                    value: hostelName,
                    onChanged: (value) {
                      setState(() {
                        hostelName = value.toString();
                      });
                    },
                    items: [
                      'NewLH A-Block',
                      'NewLH B-Block',
                      'NewLH C-Block',
                      'Priyadarshini RightWing',
                      'Priyadarshini LeftWing',
                      'Priyadarshini Central Block',
                      'SarojiniDevi Block',
                      '13th Block',
                    ].map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Room Number'),
                    onChanged: (value) {
                      roomNumber = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter room number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Enter your complaint'),
                    onChanged: (value) {
                      complaint = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter complaint description';
                      }
                      return null;
                    },
                  ),
                ],
              ),
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
                if (_formKey.currentState!.validate()) {
                  _addComplaint(complaint, roomNumber, hostelName, category);
                  Navigator.pop(context); // Close the dialog
                }
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
