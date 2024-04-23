import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart'; // Import the carousel_slider package
import 'package:hamburger/messpage21.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderPage(),
    );
  }
}

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final List<String> allItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  List<String> filteredItems = [];
  int totalMealCount = 0;

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(allItems);
  }

  void filterList(String query) {
    setState(() {
      filteredItems = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  bool isMealAvailable(TimeOfDay startTime, TimeOfDay endTime) {
    var now = DateTime.now();
    var startTimeDateTime =
    DateTime(now.year, now.month, now.day, startTime.hour, startTime.minute);
    var endTimeDateTime =
    DateTime(now.year, now.month, now.day, endTime.hour, endTime.minute);
    var currentTime = now;

    return currentTime.isAfter(startTimeDateTime) &&
        currentTime.isBefore(endTimeDateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: filterList,
              ),
            ),
            if (isMealAvailable(const TimeOfDay(hour: 7, minute: 0), const TimeOfDay(hour: 9, minute: 0)))
              CustomLayout(
                icon: Icons.restaurant,
                mealName: 'Breakfast',
                menuInfo: 'Menu for breakfast...',
                onMealCountChanged: (count) {
                  setState(() {
                    totalMealCount = count;
                  });
                },
              )
            else
              const BlockedSection(
                mealName: 'Breakfast',
                blockReason: 'Breakfast is available from 7am to 9am only.',
              ),
            if (isMealAvailable(const TimeOfDay(hour: 12, minute: 0), const TimeOfDay(hour: 14, minute: 0)))
              CustomLayout(
                icon: Icons.restaurant,
                mealName: 'Lunch',
                menuInfo: 'Menu for lunch...',
                onMealCountChanged: (count) {
                  setState(() {
                    totalMealCount = count;
                  });
                },
              )
            else
              const BlockedSection(
                mealName: 'Lunch',
                blockReason: 'Lunch is available from 12pm to 2pm only.',
              ),
            if (isMealAvailable(const TimeOfDay(hour: 19, minute: 0), const TimeOfDay(hour: 21, minute: 0)))
              CustomLayout(
                icon: Icons.restaurant,
                mealName: 'Dinner',
                menuInfo: 'Menu for dinner...',
                onMealCountChanged: (count) {
                  setState(() {
                    totalMealCount = count;
                  });
                },
              )
            else
              const BlockedSection(
                mealName: 'Dinner',
                blockReason: 'Dinner is available from 7pm to 9pm only.',
              ),
            if (totalMealCount != 1)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Change quantity of meal',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            if (totalMealCount > 0)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: totalMealCount == 1 ? _navigateToCheckout : null,
                      child: const Text('Place your order'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _navigateToCheckout() {
    // Navigate to the checkout page
    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderDetailsPage()));
  }
}

class CustomLayout extends StatefulWidget {
  final IconData icon;
  final String mealName;
  final String menuInfo;
  final Function(int) onMealCountChanged;

  const CustomLayout({super.key,
    required this.icon,
    required this.mealName,
    required this.menuInfo,
    required this.onMealCountChanged,
  });

  @override
  _CustomLayoutState createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  int _mealCount = 0;
  bool _showIncrementer = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(widget.icon),
              const SizedBox(width: 8),
              Text(
                widget.mealName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.menuInfo,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          if (!_showIncrementer)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showIncrementer = true;
                });
              },
              child: const Text('Add'),
            ),
          if (_showIncrementer)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_mealCount > 0) {
                        _mealCount--;
                        widget.onMealCountChanged(_mealCount);
                      }
                    });
                  },
                ),
                Text(
                  '$_mealCount',
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _mealCount++;
                      widget.onMealCountChanged(_mealCount);
                    });
                  },
                ),
              ],
            ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            height: 30,
          ),
        ],
      ),
    );
  }
}

class BlockedSection extends StatelessWidget {
  final String mealName;
  final String blockReason;

  const BlockedSection({super.key,
    required this.mealName,
    required this.blockReason,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mealName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            blockReason,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
            height: 30,
          ),
        ],
      ),
    );
  }
}