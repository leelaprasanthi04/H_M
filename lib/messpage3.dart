import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderPageDetails(),
    );
  }
}

class OrderPageDetails extends StatefulWidget {
  const OrderPageDetails({Key? key}) : super(key: key);

  @override
  _OrderPageDetailsState createState() => _OrderPageDetailsState();
}

class _OrderPageDetailsState extends State<OrderPageDetails> {
  late String _mealType;
  bool _isDonePressed = false;

  @override
  void initState() {
    super.initState();
    _mealType = getMealType(); // Get the meal type here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 8,
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Order Date',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                'Order Time',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                '${DateTime.now().hour}:${DateTime.now().minute}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Meals Placed',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            '1 * $_mealType', // Replace with the actual number of meals placed
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: _isDonePressed ? null : _handleDonePressed,
                        child: const Text('Done'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_isDonePressed)
            Image.asset(
              'assets/welcome.png', // Replace 'your_image.png' with the path to your image asset
              width: 200,
              height: 200,
            ),
        ],
      ),
    );
  }

  void _handleDonePressed() {
    setState(() {
      _isDonePressed = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Your order is served.'),
      ),
    );
  }

  String getMealType() {
    final now = DateTime.now();
    if (now.hour >= 7 && now.hour < 9) {
      return 'Breakfast';
    } else if (now.hour >= 12 && now.hour < 14) {
      return 'Lunch';
    } else if (now.hour >= 19 && now.hour < 21) {
      return 'Dinner';
    } else {
      return 'Unknown';
    }
  }
}
