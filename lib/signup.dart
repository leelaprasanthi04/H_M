import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class SignupPage extends StatelessWidget {
//   const SignupPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.black,),
//
//
//         ), systemOverlayStyle: SystemUiOverlayStyle.dark,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 40),
//           height: MediaQuery.of(context).size.height - 50,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   const Text("Sign up",
//                     style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//
//                     ),),
//                   const SizedBox(height: 20,),
//                   Text("Create an account, It's free ",
//                     style: TextStyle(
//                         fontSize: 15,
//                         color:Colors.grey[700]),)
//
//
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   inputFile(label: "Name"),
//                   inputFile(label: "Phone Number"),
//                   inputFile(label: "Password", obscureText: true),
//                   inputFile(label: "Confirm Password ", obscureText: true),
//                 ],
//               ),
//               Container(
//                 padding: const EdgeInsets.only(top: 3, left: 3),
//                 decoration:
//                 BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     border: const Border(
//                       bottom: BorderSide(color: Colors.black),
//                       top: BorderSide(color: Colors.black),
//                       left: BorderSide(color: Colors.black),
//                       right: BorderSide(color: Colors.black),
//
//
//
//                     )
//
//                 ),
//                 child: MaterialButton(
//                   minWidth: double.infinity,
//                   height: 60,
//                   onPressed: () {},
//                   color: const Color(0xff0095FF),
//                   elevation: 0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50),
//
//                   ),
//                   child: const Text(
//                     "Sign up", style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18,
//                     color: Colors.white,
//
//                   ),
//                   ),
//
//                 ),
//
//
//
//               ),
//               const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text("Already have an account?"),
//                   Text(" Login", style:TextStyle(
//                       fontWeight: FontWeight.w600,
//                       fontSize: 18
//                   ),
//                   )
//                 ],
//               )
//
//
//
//             ],
//
//           ),
//
//
//         ),
//
//       ),
//
//     );
//   }
// }
//
//
//
// // we will be creating a widget for text field
// Widget inputFile({label, obscureText = false})
// {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: const TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w400,
//             color:Colors.black87
//         ),
//
//       ),
//       const SizedBox(
//         height: 5,
//       ),
//       TextField(
//         obscureText: obscureText,
//         decoration: const InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 0,
//                 horizontal: 10),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                   color: Colors.grey
//               ),
//
//             ),
//             border: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey)
//             )
//         ),
//       ),
//       const SizedBox(height: 10,)
//     ],
//   );
// }

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordMatch = true;
  bool _isPhoneNumberValid = true;
  bool _isNameEmpty = true;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "Sign up",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Create an account, It's free",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700], fontFamily: 'Poppins'),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    inputFile(label: "Name", controller: _nameController),
                    if (!_isNameEmpty) Text("Name cannot be empty", style: TextStyle(color: Colors.red)),
                    inputFile(label: "Phone Number", controller: _phoneNumberController),
                    if (!_isPhoneNumberValid) Text("Enter a valid phone number", style: TextStyle(color: Colors.red)),
                    inputFile(label: "Password", obscureText: true, controller: _passwordController),
                    inputFile(label: "Confirm Password", obscureText: true, controller: _confirmPasswordController),
                    if (!_isPasswordMatch) Text("Passwords do not match", style: TextStyle(color: Colors.red)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_passwordController.text != _confirmPasswordController.text) {
                        setState(() {
                          _isPasswordMatch = false;
                        });
                      } else {
                        setState(() {
                          _isPasswordMatch = true;
                        });
                        // Passwords match, continue with signup process
                        // For now, just show a snackbar indicating success
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sign up successful')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(150, 40),
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white, fontFamily: 'Poppins'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.blue, fontFamily: 'Poppins'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget inputFile({required String label, bool obscureText = false, TextEditingController? controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87, fontFamily: 'Poppins'),
      ),
      const SizedBox(height: 5),
      TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return "${label.toLowerCase()} cannot be empty";
          }
          if (label == "Confirm Password" && value != controller!.text) {
            return "Passwords do not match";
          }
          if (label == "Phone Number" && (value.length != 10 || int.tryParse(value) == null)) {
            return "Enter a valid phone number";
          }
          return null;
        },
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        style: const TextStyle(fontFamily: 'Poppins'),
      ),
      const SizedBox(height: 10),
    ],
  );
}