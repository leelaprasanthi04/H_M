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
      home: MyMenuScreen1(),
    );
  }
}

class SubmissionData {
  final String? studentId;
  final String? foodItem;
  final int rating;

  SubmissionData({required this.studentId, required this.foodItem, required this.rating});
}

class MyMenuScreen1 extends StatefulWidget {
  @override
  _MyMenuScreenState createState() => _MyMenuScreenState();
}

class _MyMenuScreenState extends State<MyMenuScreen1> {
  String? _selectedDay;
  String? _selectedMealType;
  String? _selectedFoodItem;
  int _rating = 0; // Default rating value
  TextEditingController _studentIdController = TextEditingController(); // Controller for student ID input

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

  List<SubmissionData> _submissions = [];

  void _submitRating() {
    if (_selectedFoodItem != null && _rating > 0) {
      String studentId = _studentIdController.text;
      SubmissionData newSubmission = SubmissionData(studentId: studentId, foodItem: _selectedFoodItem, rating: _rating);
      setState(() {
        _submissions.add(newSubmission);
      });

      print('Rating submitted: $_rating');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Rating submitted: $_rating'),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AdminPage(submissions: _submissions),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
          backgroundColor: Colors.blue[100]
      ),
        backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                            _selectedMealType = null;
                          });
                        },
                        items: <String>[
                          'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday',
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
                      DropdownButton<String>(
                        value: _selectedMealType,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedMealType = newValue!;
                          });
                        },
                        items: _selectedDay != null && _menuData.containsKey(_selectedDay)
                            ? _menuData[_selectedDay]!.keys.map<DropdownMenuItem<String>>((mealType) {
                          return DropdownMenuItem<String>(
                            value: mealType,
                            child: Text(mealType),
                          );
                        }).toList()
                            : [],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
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
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedFoodItem = menuItem;
                                  _rating = 0;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(menuItem),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  : Container(),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Select Food Item',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      DropdownButton<String>(
                        value: _selectedFoodItem,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedFoodItem = newValue!;
                          });
                        },
                        items: _selectedMealType != null &&
                            _menuData.containsKey(_selectedDay) &&
                            _menuData[_selectedDay]!.containsKey(_selectedMealType)
                            ? _menuData[_selectedDay]![_selectedMealType]!.map<DropdownMenuItem<String>>((foodItem) {
                          return DropdownMenuItem<String>(
                            value: foodItem,
                            child: Text(foodItem),
                          );
                        }).toList()
                            : [],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Enter Student ID',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _studentIdController,
                        decoration: InputDecoration(
                          hintText: 'Student ID',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (_selectedMealType != null)
                Column(
                  children: [
                    Text(
                      'Submit Rating:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 1; i <= 5; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _rating = i;
                              });
                            },
                            child: Icon(
                              i <= _rating ? Icons.star : Icons.star_border,
                              size: 40,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _submitRating,
                      child: Text('Submit'),
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

class AdminPage extends StatelessWidget {
  final List<SubmissionData> submissions;

  AdminPage({required this.submissions});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> foodItemRatings = {};
    submissions.forEach((submission) {
      if (!foodItemRatings.containsKey(submission.foodItem)) {
        foodItemRatings[submission.foodItem!] = {'totalRating': 0, 'count': 0, 'ratings': <int>[]};
      }
      foodItemRatings[submission.foodItem!]['totalRating'] += submission.rating;
      foodItemRatings[submission.foodItem!]['count']++;
      foodItemRatings[submission.foodItem!]['ratings'].add(submission.rating);
    });

    Map<String, double> averageRatings = {};
    foodItemRatings.forEach((foodItem, data) {
      int totalRating = data['totalRating'];
      int count = data['count'];
      averageRatings[foodItem] = totalRating / count;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: ListView.builder(
        itemCount: averageRatings.length,
        itemBuilder: (context, index) {
          String foodItem = averageRatings.keys.elementAt(index);
          double averageRating = averageRatings[foodItem]!;
          List<int> individualRatings = foodItemRatings[foodItem]['ratings'];
          return Card(
            elevation: 4,
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text('Food Item: $foodItem'),
                  subtitle: Text('Average Rating: ${averageRating.toStringAsFixed(1)}'),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Individual Ratings:'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: individualRatings.map((rating) {
                    return ListTile(
                      title: Text('Rating: $rating'),
                    );
                  }).toList(),
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}

