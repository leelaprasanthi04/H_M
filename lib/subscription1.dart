import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Subscription Page'),
        ),
        body: const OrderPageDetails(),
      ),
    );
  }
}

class OrderPageDetails extends StatefulWidget {
  const OrderPageDetails({super.key});

  @override
  _OrderPageDetailsState createState() => _OrderPageDetailsState();
}

class _OrderPageDetailsState extends State<OrderPageDetails> {
  int _count = 1;

  void _decrementCount() {
    setState(() {
      if (_count > 1) {
        _count--;
      }
    });
  }

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  bool isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Column(
            children: [
              Text('Subscription', style: TextStyle(fontSize: 20),),
              SizedBox(height: 8.0,),
              Text('Meal Subscription for 15 Days'),
            ],
          ),


          // Display the subscription button if not subscribed
          !isSubscribed
              ? ElevatedButton(
            onPressed: () {
              // Set the isSubscribed flag to true when the button is pressed
              setState(() {
                isSubscribed = true;
              });
            },
            child: const Text('Subscribe Now'),
          )
              : const SizedBox(), // Hide the subscription button if already subscribed
          // Display the count buttons if subscribed
          isSubscribed
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _decrementCount,
                child: const Text(
                  '-',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(width: 20),
              Text(
                '$_count',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: _incrementCount,
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          )
              : const SizedBox(), // Hide the count buttons if not subscribed
        ],
      ),
    );
  }
}
