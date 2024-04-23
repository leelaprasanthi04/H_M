import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';
import 'package:hamburger/messpage3.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OrderDetailsPage(),
    );
  }
}

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  String orderId = '';
  String counterName = 'LH Counter';
  bool orderServed = false;

  int _generateOrderId() {
    Random random = Random();
    return random.nextInt(1000000); // Generate a random 6-digit number
  }

  @override
  Widget build(BuildContext context) {
    orderId = _generateOrderId().toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Order Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(Icons.fastfood), // Food animation icon
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'NITW',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        height: 1,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order ID'),
                          Text('Counter'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order ID: $orderId'),
                          Text(counterName),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: 8,
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Order ID: $orderId',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: Text(
                          'from LH Mess',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: QrImageView(
                          data: orderId, // Data for QR code (here, the order ID)
                          version: QrVersions.auto,
                          size: 200.0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              orderServed = true;
                            });
                            // Add logic for when the order is served
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPageDetails()));
                            // For example: Navigate to a new page or show a confirmation message
                          },
                          child: const Text('Order Served'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
