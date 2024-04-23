import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:hamburger/messpage1.dart';

class PaymentSuccessPage extends StatefulWidget {
  final String paymentId;

  PaymentSuccessPage({Key? key, required this.paymentId}) : super(key: key);

  @override
  _PaymentSuccessPageState createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  bool _isBlocked = false;
  bool _isDonePressed = false;

  void _blockQRCode() {
    setState(() {
      _isBlocked = !_isBlocked;
    });
  }

  void _onDonePressed() {
    setState(() {
      _isDonePressed = true;
    });
  }

  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  DateFormat timeFormat = DateFormat('HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Successful'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          'Subscription Successful',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            GestureDetector(
                              onTap: _isBlocked ? null : _blockQRCode,
                              child: QrImageView(
                                data: jsonEncode({
                                  'orderId': 'ORDER_${DateTime.now().millisecondsSinceEpoch}',
                                  'subscriptionDetails': {
                                    'paymentId': widget.paymentId,
                                    'subscriptionDate': DateTime.now().toString(),
                                    'validityEndDate': DateTime.now().add(Duration(days: 20)).toString(),
                                  },
                                }),
                                version: QrVersions.auto,
                                size: 200,
                              ),
                            ),
                            if (_isBlocked)
                              Container(
                                width: 200,
                                height: 200,
                                color: Colors.grey.withOpacity(0.5), // Grey semi-transparent color
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          'Order ID: ORDER_${DateTime.now().millisecondsSinceEpoch}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Subscription Date: ${dateFormat.format(DateTime.now())}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Subscription Time: ${timeFormat.format(DateTime.now())}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Validity End Date: ${dateFormat.format(DateTime.now().add(Duration(days: 20)))}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Validity End Time: ${timeFormat.format(DateTime.now().add(Duration(days: 20)))}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  // onPressed: _isDonePressed ? () => Navigator.pop(context) : _onDonePressed,
                  // child: Text(_isDonePressed ? 'Back to Home' : 'Done'),
                  onPressed: _isDonePressed ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MessPage()), // Replace HomePage with the name of your homepage widget
                    );
                  } : _onDonePressed,
                  child: Text(_isDonePressed ? 'Back to Home' : 'Done'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}