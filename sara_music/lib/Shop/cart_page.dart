import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sara_music/Screens/Details_screen.dart';
import 'package:sara_music/Shop/Shop.dart';
import 'package:sara_music/Shop/product_detail_page.dart';
import 'product_data.dart';
import 'colors.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:sara_music/globalss.dart';



class CartPage extends StatefulWidget {
  @override
 
  
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
    Map<String, dynamic>? paymentIntentData;


  late Razorpay _razorpay;
 static const platform = const MethodChannel("razorpay_flutter");

  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
  }

   void openCheckout() async {
    var options = {

      'key': "rzp_test_8xyYa69mP2tBT3",
   'amount': 50000, //in the smallest currency sub-unit.
  'name': '${globalss.StudentName}',
  'description': 'Fine T-Shirt',
  'timeout': 600, // in seconds
  'prefill': {
    'contact': '9123456789',
    'email': 'gaurav.kumar@example.com'
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      // debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    // Fluttertoast.showToast(
    //     msg: "SUCCESS: " + response.paymentId!,
    //     toastLength: Toast.LENGTH_SHORT); 
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    //  Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
    //     toastLength: Toast.LENGTH_SHORT); 
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    //  Fluttertoast.showToast(
    //     msg: "EXTERNAL_WALLET: " + response.walletName!,
    //     toastLength: Toast.LENGTH_SHORT); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: <Widget>[      
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: InkWell(
                    child: Image.asset(
                      'images/icons-back.png',
                      height: 30,
                    ),
                    onTap: () {
                      Navigator.pop(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRightWithFade,
                          alignment: Alignment.topCenter,
                          child: Shop(),
                          duration: Duration(milliseconds: 1000),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
                  child: Text(
                    'My Cart',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.black),
                  ),
                ),
                
              ],
            ),  
            SizedBox(height: 50,),    
        Column(
          children: List.generate(3, (index) {
            return FadeInDown(
              duration: Duration(milliseconds: 350 * index),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 231, 241, 241),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 0.5,
                                color: black.withOpacity(0.1),
                                blurRadius: 1)
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 25, right: 25, bottom: 25),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 140,
                                height: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                             products[index]['img']),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          products[index]['name'],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "\$ " + products[index]['price'],
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "x1",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            );
          }),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Total",
                style: TextStyle(
                    fontSize: 22,
                    color: black.withOpacity(0.5),
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "\$ 1059.00",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Colors.pink[600],
              onPressed: () {
              
            openCheckout();
              },
              child: Container(
                height: 50,
                child: Center(
                  child: Text(
                    "CHECKOUT",
                    style: TextStyle(
                        color: white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )),
        )
      ],
    );
  }


}
