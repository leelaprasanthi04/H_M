import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hamburger/signup.dart';
import 'package:hamburger/mess_hostel_selection.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
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
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Expanded(child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Column(
//                     children: <Widget>[
//                       const Text("Login",
//                         style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
//                       const SizedBox(height: 20,),
//                       Text("Login to your account",
//                         style: TextStyle(
//                             fontSize: 15,
//                             color:Colors.grey[700]),)
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 40),
//                     child: Column(
//                       children: <Widget>[
//                         inputFile(label: "Phone Number"),
//                         inputFile(label: "Password", obscureText: true)
//                       ],
//                     ),
//                   ),
//                   Padding(padding:
//                   const EdgeInsets.symmetric(horizontal: 40),
//                     child: Container(
//                       padding: const EdgeInsets.only(top: 3, left: 3),
//                       decoration:
//                       BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           border: const Border(
//                             bottom: BorderSide(color: Colors.black),
//                             top: BorderSide(color: Colors.black),
//                             left: BorderSide(color: Colors.black),
//                             right: BorderSide(color: Colors.black),
//
//                           )
//
//
//
//                       ),
//                       child: MaterialButton(
//                         minWidth: double.infinity,
//                         height: 60,
//                         onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyHomePage())); },
//                         color: const Color(0xff0095FF),
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(50),
//
//                         ),
//                         child: const Text(
//                           "Login", style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18,
//                           color: Colors.white,
//
//                         ),
//                         ),
//
//                       ),
//                     ),
//                   ),
//
//
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text("Don't have an account?"),
//                       Text(" Sign up", style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 18,
//
//                       ),)
//                     ],
//                   ),
//
//                   Container(
//                     padding: const EdgeInsets.only(top: 100),
//                     height: 200,
//                     decoration: const BoxDecoration(
//                       image: DecorationImage(
//                           image: AssetImage("assets/welcome.png"),
//                           fit: BoxFit.fitHeight
//                       ),
//
//                     ),
//                   )
//
//                 ],
//               ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }
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


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hostel Page1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoggingIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 20),
                Text(
                  "Login to your account",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(fontFamily: 'Poppins'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your phone number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(fontFamily: 'Poppins'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: _isLoggingIn ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                    child: _isLoggingIn
                        ? const CircularProgressIndicator()
                        : const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontFamily: 'Poppins', fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        " Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.blue,
                        ),
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


  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoggingIn = true;
      });
      // Simulate a login process
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoggingIn = false;
        });
        // Navigate to home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
      });
    }
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//       ),
//       body: const Center(
//         child: Text("Welcome!"),
//       ),
//     );
//   }
// }