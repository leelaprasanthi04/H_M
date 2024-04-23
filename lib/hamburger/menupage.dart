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
      home: MyMenuScreen(),
    );
  }
}

class MyMenuScreen extends StatefulWidget {
  @override
  _MyMenuScreenState createState() => _MyMenuScreenState();
}

class _MyMenuScreenState extends State<MyMenuScreen> {
  String? _selectedDay ;
  String? _selectedMealType;

  Map<String, Map<String, List<String>>> _menuData = {
    'Monday': {
      'Breakfast': ['Pancakes', 'Eggs', 'Toast'],
      'Lunch': ['Sandwich', 'Salad', 'Soup'],
      'Dinner': ['Steak', 'Pasta', 'Pizza'],
    },
    'Tuesday': {
      'Breakfast': ['Oatmeal', 'Fruit', 'Yogurt'],
      'Lunch': ['Burger', 'Fries', 'Coleslaw'],
      'Dinner': ['Fish', 'Rice', 'Vegetables'],
    },
    'Wednesday': {
      'Breakfast': ['Bagel', 'Cream Cheese', 'Coffee'],
      'Lunch': ['Wrap', 'Chips', 'Fruit Salad'],
      'Dinner': ['Chicken', 'Mashed Potatoes', 'Green Beans'],
    },
    'Thursday': {
      'Breakfast': ['Waffles', 'Sausage', 'Orange Juice'],
      'Lunch': ['Taco', 'Guacamole', 'Salsa'],
      'Dinner': ['Baked Potato', 'Broccoli', 'Roll'],
    },
    'Friday': {
      'Breakfast': ['Croissant', 'Cereal', 'Milk'],
      'Lunch': ['Sushi', 'Edamame', 'Miso Soup'],
      'Dinner': ['Burger', 'Sweet Potato Fries', 'Milkshake'],
    },
    'Saturday': {
      'Breakfast': ['French Toast', 'Bacon', 'Maple Syrup'],
      'Lunch': ['Salmon', 'Quinoa', 'Asparagus'],
      'Dinner': ['Lasagna', 'Garlic Bread', 'Caesar Salad'],
    },
    'Sunday': {
      'Breakfast': ['Pancakes', 'Sausage', 'Orange Juice'],
      'Lunch': ['Roast Beef', 'Potatoes', 'Carrots'],
      'Dinner': ['Pizza', 'Wings', 'Caesar Salad'],
    },
    // Add menu data for other days here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Menu'),
          backgroundColor: Colors.blue[100]
      ), backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown to select day
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'Select Day',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    DropdownButton<String>(
                      value: _selectedDay,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedDay = newValue!;
                          _selectedMealType = null; // Reset selected meal type
                        });
                      },
                      items: <String>[
                        'Monday', 'Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday',
                        // Add other days here
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Dropdown to select meal type
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(

                  children: [
                    Text(
                      'Select Meal',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    // DropdownButton<String>(
                    //   value: _selectedMealType,
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       _selectedMealType = newValue;
                    //     });
                    //   },
                    //   items: _selectedDay != null && _menuData.containsKey(_selectedDay)
                    //       ? _menuData[_selectedDay]!.keys.map<DropdownMenuItem<String>>((mealType) {
                    //     return DropdownMenuItem<String>(
                    //       value: mealType,
                    //       child: Text(mealType),
                    //     );
                    //   }).toList()
                    //       : [],
                    // ),
                    DropdownButton<String>(
                        value: _selectedMealType,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedMealType = newValue;
                          });
                        },
                      items: <String>[
                        // 'Monday', 'Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday',
                        // Add other days here
                        'Breakfast','Lunch','Dinner',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Display menu
            // _selectedMealType != null && _menuData.containsKey(_selectedDay)
            //     ? Expanded(
            //   child: SizedBox(
            //     height: MediaQuery.of(context).size.height * 0.7 ,
            //     width: MediaQuery.of(context).size.width * 0.3,
            //     child: Card(
            //       elevation: 4,
            //       child: Padding(
            //         padding: const EdgeInsets.all(16.0),
            //
            //         child: ListView.builder(
            //           itemCount: _menuData[_selectedDay]![_selectedMealType!]!.length,
            //           itemBuilder: (context, index) {
            //             return ListTile(
            //               title: Text(_menuData[_selectedDay]![_selectedMealType!]![index]),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //   ),
            //
            // )
            //     : Container(),
            // SizedBox(height: 20),

            _selectedMealType != null && _menuData.containsKey(_selectedDay)
                ? Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Menu',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _menuData[_selectedDay]![_selectedMealType!]!.map<Widget>((menuItem) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(menuItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            )
                : Container(),
          ],
        ),
      ),
        // print('Selected Day: $_selectedDay');
        // print('Selected Meal Type: $_selectedMealType');
    // print('Menu Data: $_menuData');
    );
  }
}

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
//       home: MyMenuScreen(),
//     );
//   }
// }
//
// class MyMenuScreen extends StatefulWidget {
//   @override
//   _MyMenuScreenState createState() => _MyMenuScreenState();
// }
//
// class _MyMenuScreenState extends State<MyMenuScreen> {
//   String _selectedDay = 'Monday';
//   String? _selectedMealType;
//   Map<String, Map<String, List<String>>> _menuData = {
//     'Monday': {
//       'Breakfast': ['Pancakes', 'Eggs', 'Toast'],
//       'Lunch': ['Sandwich', 'Salad', 'Soup'],
//       'Dinner': ['Steak', 'Pasta', 'Pizza'],
//     },
//     // Add menu data for other days here
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Menu'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Select Day',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10),
//                     DropdownButton<String>(
//                       value: _selectedDay,
//                       onChanged: (newValue) {
//                         setState(() {
//                           _selectedDay = newValue!;
//                           _selectedMealType = null; // Reset selected meal type
//                         });
//                       },
//                       items: <String>[
//                         'Monday',
//                         // Add other days here
//                       ].map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Card(
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Select Meal',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10),
//                     DropdownButton<String>(
//                       value: _selectedMealType,
//                       onChanged: (newValue) {
//                         setState(() {
//                           _selectedMealType = newValue;
//                         });
//                       },
//                       items: _selectedDay != null && _menuData.containsKey(_selectedDay)
//                           ? _menuData[_selectedDay]!.keys.map<DropdownMenuItem<String>>((mealType) {
//                         return DropdownMenuItem<String>(
//                           value: mealType,
//                           child: Text(mealType),
//                         );
//                       }).toList()
//                           : [],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             // Display menu
//             Card(
//               elevation: 4,
//               child: _selectedMealType != null && _menuData.containsKey(_selectedDay)
//                   ? Expanded(
//                 child: ListView.builder(
//                   itemCount: _menuData[_selectedDay]![_selectedMealType!]!.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(_menuData[_selectedDay]![_selectedMealType!]![index]),
//                     );
//                   },
//                 ),
//               )
//                   : Container(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
