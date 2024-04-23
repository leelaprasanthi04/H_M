//
//
// import 'package:flutter/material.dart';
// import 'package:timezone/data/latest.dart' as tzdata;
// import 'package:timezone/timezone.dart' as tz;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Subscription App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SubscriptionScreen(),
//     );
//   }
// }
//
// class SubscriptionScreen extends StatefulWidget {
//   @override
//   _SubscriptionScreenState createState() => _SubscriptionScreenState();
// }
//
// class _SubscriptionScreenState extends State<SubscriptionScreen> {
//   bool _cardTaken = false;
//   int _validDays = 15;
//   DateTime? _subscriptionStartDate;
//   DateTime? _lastConsumedDate;
//
//   @override
//   void initState() {
//     super.initState();
//     tzdata.initializeTimeZones();
//   }
//
//   void _takeCard() {
//     setState(() {
//       _cardTaken = true;
//       _subscriptionStartDate = DateTime.now();
//     });
//   }
//
//   void _consumeMeal() {
//     if (_validDays > 0) {
//       final DateTime currentDate = DateTime.now();
//       if (_lastConsumedDate == null || _lastConsumedDate!.day != currentDate.day) {
//         setState(() {
//           _validDays--;
//           _lastConsumedDate = currentDate;
//         });
//       }
//     }
//   }
//
//   void _checkValidityAndRenew() async {
//     if (_subscriptionStartDate != null) {
//       final DateTime currentDateTime = DateTime.now();
//
//       final Duration subscriptionDuration = currentDateTime.difference(_subscriptionStartDate!);
//       final int daysSinceSubscription = subscriptionDuration.inDays;
//
//       if (_validDays == 0 || daysSinceSubscription >= 21) {
//         // Card expired, prompt for renewal
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Card Expired'),
//               content: Text('Your subscription card has expired. Would you like to renew it?'),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     setState(() {
//                       _validDays = 15;
//                       _subscriptionStartDate = currentDateTime;
//                       _cardTaken = false; // Set cardTaken to false to redirect to subscription card page
//                       _lastConsumedDate = null; // Reset last consumed date
//                     });
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('Renew'),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('Cancel'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Subscription App'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.menu),
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: Text('Validity Information'),
//                     content: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         if (_subscriptionStartDate != null)
//                           Text('Start Date: ${_subscriptionStartDate!}'),
//                         Text('Days Left for Validity: $_validDays'),
//                       ],
//                     ),
//                     actions: <Widget>[
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Text('Close'),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: _cardTaken
//             ? Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Valid Days Remaining: $_validDays',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _consumeMeal();
//                 _checkValidityAndRenew();
//               },
//               child: Text('Breakfast'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _consumeMeal();
//                 _checkValidityAndRenew();
//               },
//               child: Text('Lunch'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _consumeMeal();
//                 _checkValidityAndRenew();
//               },
//               child: Text('Dinner'),
//             ),
//           ],
//         )
//             : ElevatedButton(
//           onPressed: () {
//             _takeCard();
//           },
//           child: Text('Take Subscription Card'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subscription App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SubscriptionScreen(),
    );
  }
}

class SubscriptionScreen extends StatefulWidget {
  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool _cardTaken = false;
  int _validDays = 15;
  DateTime? _subscriptionStartDate;
  DateTime? _lastConsumedDate;

  @override
  void initState() {
    super.initState();
    tzdata.initializeTimeZones();
  }

  void _takeCard() {
    setState(() {
      _cardTaken = true;
      _subscriptionStartDate = DateTime.now();
    });
  }

  void _consumeMeal() {
    if (_validDays > 0) {
      final DateTime currentDate = DateTime.now();
      if (_lastConsumedDate == null || _lastConsumedDate!.day != currentDate.day) {
        setState(() {
          _validDays--;
          _lastConsumedDate = currentDate;
        });
      }
    }
  }

  void _checkValidityAndRenew() async {
    if (_subscriptionStartDate != null) {
      final DateTime currentDateTime = DateTime.now();

      final Duration subscriptionDuration = currentDateTime.difference(_subscriptionStartDate!);
      final int daysSinceSubscription = subscriptionDuration.inDays;

      if (_validDays == 0 || daysSinceSubscription >= 21) {
        // Card expired, prompt for renewal
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Card Expired'),
              content: Text('Your subscription card has expired. Would you like to renew it?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    setState(() {
                      _validDays = 15;
                      _subscriptionStartDate = currentDateTime;
                      _cardTaken = false; // Set cardTaken to false to redirect to subscription card page
                      _lastConsumedDate = null; // Reset last consumed date
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Renew'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Validity Information'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (_subscriptionStartDate != null)
                          Text('Start Date: ${_subscriptionStartDate!}'),
                        Text('Days Left for Validity: $_validDays'),
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _cardTaken
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Valid Days Remaining: $_validDays',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _consumeMeal();
                _checkValidityAndRenew();
              },
              child: Text('Breakfast'),
            ),
            ElevatedButton(
              onPressed: () {
                _consumeMeal();
                _checkValidityAndRenew();
              },
              child: Text('Lunch'),
            ),
            ElevatedButton(
              onPressed: () {
                _consumeMeal();
                _checkValidityAndRenew();
              },
              child: Text('Dinner'),
            ),
          ],
        )
            : ElevatedButton(
          onPressed: () {
            _takeCard();
          },
          child: Text('Take Subscription Card'),
        ),
      ),
    );
  }
}

