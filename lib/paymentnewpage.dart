import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayPagenew extends StatefulWidget {
  const RazorPayPagenew({Key? key}) : super(key: key);

  @override
  _RazorPayPageState createState() => _RazorPayPageState();
}

class _RazorPayPageState extends State<RazorPayPagenew> {
  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();

  void openCheckout() async {
    int amount = 1725 * 100; // Amount in paisa
    var options = {
      'key': 'rzp_test_f86jtaBaqgpkbt',
      'amount': amount,
      'name': 'SmartQ',
      'prefill': {'contact': '1234567890', 'email': 'test@gmail.com'},
      'external': {'wallets': ['paytm']}
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Successful " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Fail " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.blue[100],
            child: Column(
              children: [
                SizedBox(height: 100,),
                Image.network('https://content3.jdmagicbox.com/comp/lucknow/n3/0522px522.x522.200813144523.e4n3/catalogue/food-pay-gomti-nagar-lucknow-food-delivery-in-trains-awrvzobh4o.jpg',height: 100, width: 300,),
                SizedBox(height: 10,),
                Text("Welcome to Payment Gateway Integration", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Poppins'),textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    autofocus: false,
                    style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                    decoration: InputDecoration(
                        labelText: 'Enter Amount to be paid',
                        labelStyle: TextStyle(fontSize: 15.0, color: Colors.black, fontFamily: 'Poppins'),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            )
                        ),
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15, fontFamily: 'Poppins')
                    ),
                    controller: amtController,
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return "Please enter Amount to be paid";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: (){
                    if(amtController.text.toString().isNotEmpty){
                      int enteredAmount = int.parse(amtController.text.toString());
                      if(enteredAmount == 1725){
                        setState(() {
                          openCheckout();
                        });
                      } else {
                        Fluttertoast.showToast(
                            msg: "Only 1725/- can be paid",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.red,
                            textColor: Colors.white
                        );
                      }
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Make Payment', style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                  ),
                )
              ],

            ),
          ),
        ));
  }
}