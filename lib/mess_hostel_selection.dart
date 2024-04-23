import 'package:flutter/material.dart';
// import 'package:hamburger/hostelredirect.dart';
import 'package:hamburger/hostelpage1.dart';
import 'package:hamburger/messpage1.dart';
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("HOSTEL HIVE"),
//       ),
//
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 300,
//               height: 80,
//               child: CustomButton(
//                 icon: Icons.food_bank,
//                 text: "MESS",
//                 additionalText: "Where Yummy food is awaiting",
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  MessPage()));
//                   // Add your onPressed logic here
//
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: 300,
//               height: 80,
//               child: CustomButton(
//                 icon: Icons.hotel,
//                 text: "Hostel",
//                 additionalText: "Right place for peaceful life",
//                 onPressed: () {
//                   // Add your onPressed logic here
//                   Navigator.push(context, MaterialPageRoute(builder: (context) =>  HostelPage()));
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//
//     );
//   }
// }
//
// class CustomButton extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   final String additionalText; // New additional text
//   final VoidCallback onPressed;
//
//   const CustomButton({super.key,
//     required this.icon,
//     required this.text,
//     required this.additionalText,
//     required this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjust padding as needed
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Icon(
//             icon,
//             size: 32, // Set the icon size
//           ),
//           const SizedBox(width: 20), // Adjust the spacing between icon and text
//           Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Center(
//                 child: Text(
//                   text,
//                   style: const TextStyle(
//                     fontSize: 18, // Set the font size
//                     fontWeight: FontWeight.bold, // Set the font weight
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Center(
//                 child: Text(
//                   additionalText,
//                   style: const TextStyle(
//                     fontSize: 14, // Set the font size for additional text
//                     color: Colors.white, // Customize the color if needed
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//import 'package:hamburger/hostelredirect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("H&M", style: TextStyle(fontFamily: 'Poppins')),
          backgroundColor: Colors.blue[100]
      ),
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: CustomButton(
                  icon: Icons.food_bank,
                  text: "Mess",
                  additionalText: "Where Yummy food is awaiting",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  MessPage())
                    );
                    // Add your onPressed logic here

                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: SizedBox(
                width: double.infinity,
                height: 80,
                child: CustomButton(
                  icon: Icons.hotel,
                  text: "Hostel",
                  additionalText: "Right place for peaceful life",
                  onPressed: () {
                    // Add your onPressed logic here
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  HostelPage()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final String additionalText;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.additionalText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Set light blue as button background color
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Increase padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 32,
              color: Colors.white, // Set icon color to white
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  additionalText,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}