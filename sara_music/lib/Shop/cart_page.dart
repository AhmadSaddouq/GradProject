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
    count1 = CartCount();
    NAME=CartName();
    PRICE=CartPrice();
    IMAGE=CartImage();
    QUANTITY=CartQuantity();
  }
  @override
  late Future count1;
  late Future NAME;
  late Future PRICE;
  late Future IMAGE;
  late Future QUANTITY;
  late Future totall;
  var count="0";
  var arr;
  var arr1;
  var arr2;
  var arr3;
  var name="";
  var price="";
  var image="";
  var quantity="";
  var total=0;
  List NameCart=[];
  List PriceCart=[];
  List ImageCart=[];
  List QuantityCart=[];
    Future RemoveData(var name)async{
var body1=jsonEncode({
"Name": globalss.StudentName,
'CartName':name

 });

   var res= await http.post(Uri.parse(globalss.IP+"/tasks/RemoveCart"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
                    'Authorization': 'Bearer ' + globalss.authToken 


  },body: body1);
  if(mounted){
    if(res.statusCode==200){
       print(res.body);

    }
    else{
      print("Choose Something");
    }
  }


  }
  Future CartCount() async{
try{
   var res= await http.get(Uri.parse(globalss.IP+"/tasks/getCount"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
                    'Authorization': 'Bearer ' + globalss.authToken 


  });
  if(mounted){
  if(res.statusCode==200){
    count=res.body;
  }
  }
  }catch(e){
    print(e);
  }
  if(int.parse(count)!=0){
return  await count;
  }
}

//
 Future  CartName() async{
    
    try{
    var res= await http.get(Uri.parse(globalss.IP+"/tasks/getName"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });
      if(mounted){

  if(res.statusCode==200){
 setState(() {
     name=res.body;
     
    });
    }
   
  }
    var NAME5 = name.toString();
    if(NAME5.length==0){
      return await [NameCart];
    }
    arr = NAME5.split(",");
   if(arr.toString().length==0){
     return await [NameCart];
   }
    if(count!=""){
    for(int i = 0; i<int.parse(count);i++){
      NameCart.add(arr[i]);
    }
    }
   
    } catch(e){
      print(e);
    }
     if(NameCart.length==0){
       
      return await [NameCart];
    }
        return await [NameCart];

  }


//


//

 Future  CartPrice() async{
    
    try{
    var res= await http.get(Uri.parse(globalss.IP+"/tasks/getPrice"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });
      if(mounted){

  if(res.statusCode==200){
 setState(() {
     price=res.body;
     
    });
    }
   
  }
    var NAME6 = price.toString();
    if(NAME6.length==0){
      return await [PriceCart];
    }
    arr1 = NAME6.split(",");
   if(arr1.toString().length==0){
     return await [PriceCart];
   }
    if(count!=""){
    for(int i = 0; i<int.parse(count);i++){
      PriceCart.add(arr1[i]);
    }
    }
   
    } catch(e){
      print(e);
    }
     if(PriceCart.length==0){
       
      return await [PriceCart];
    }
    for(var j =0;j<int.parse(count);j++){
total+=int.parse(PriceCart[j]);

}

        return await [PriceCart,total];

  }


//

//
 Future  CartQuantity() async{
    
    try{
    var res= await http.get(Uri.parse(globalss.IP+"/tasks/getQuantity"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });
      if(mounted){

  if(res.statusCode==200){
 setState(() {
     quantity=res.body;
     
    });
    }
   
  }
    var NAME7 = quantity.toString();
    if(NAME7.length==0){
      return await [QuantityCart];
    }
    arr2 = NAME7.split(",");
   if(arr2.toString().length==0){
     return await [QuantityCart];
   }
    if(count!=""){
    for(int i = 0; i<int.parse(count);i++){
      QuantityCart.add(arr2[i]);
    }
    }
   
    } catch(e){
      print(e);
    }
     if(QuantityCart.length==0){
       
      return await [QuantityCart];
    }
        return await [QuantityCart];
 }
  
  
//
//


//
 Future  CartImage() async{
    
    try{
    var res= await http.get(Uri.parse(globalss.IP+"/tasks/getImage12"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });
      if(mounted){

  if(res.statusCode==200){
 setState(() {
     image=res.body;
     
    });
    }
   
  }
    var NAME8 = image.toString();
    if(NAME8.length==0){
      return await [ImageCart];
    }
    arr3 = NAME8.split(",");
   if(arr3.toString().length==0){
     return await [ImageCart];
   }
    if(count!=""){
    for(int i = 0; i<int.parse(count);i++){
      ImageCart.add(arr3[i]);
    }
    }
   
    } catch(e){
      print(e);
    }
     if(ImageCart.length==0){
       
      return await [ImageCart];
    }
        return await [ImageCart];
 }


//
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
      Waitforme1(),
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
                "${total}",
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
Widget Waitforme1() {
  
  return FutureBuilder(future:count1, builder:((context, snapshot)  {

      return snapshot.data==0||int.parse(count)<=0||ImageCart.length<=0?  Center(child: CircularProgressIndicator()):
     Column(
          children:
          List.generate(int.parse(count), (index) {
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
                                        image: MemoryImage(base64Decode("${ImageCart[index]}")),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Text(
                              "${NameCart[index]}",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                              onTap: (){
                                RemoveData("${NameCart[index]}");
                              },
                              child: Icon(Icons.cancel,size: 16,color:Colors.red,),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${PriceCart[index]}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${QuantityCart[index]}",
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
        );
  }));
}

}
