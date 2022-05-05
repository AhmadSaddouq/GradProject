// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sara_music/globalss.dart';
import 'dart:convert';
import 'dart:io';


import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cart_page.dart';

import 'dart:io' as file;
import 'package:path/path.dart' as Path;
import 'colors.dart';
import 'product_slider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:sara_music/globalss.dart';

class ProductDetailPage extends StatefulWidget {
  final String id;
  final String name;
  final String img;
  final String price;
  final String image;
  final List sizes;


  const ProductDetailPage(
      {Key? key,
      
      required this.id,
      required this.name,
      required this.img,
      required this.price,
      required this.image,
      required this.sizes})
      : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _currentIntValue = 0;
  int activeSize = 0;
  var min;
  var PRICEE0=globalss.InstrumentsPrice;
  bool fav_bool = false;
  void intState() {
    super.initState();
  }
  Future RemoveData()async{
var body1=jsonEncode({
"Name": globalss.StudentName,


 });

  }
  Future sendData(int quantity) async{


var body1=jsonEncode({
"Name": globalss.StudentName,
'CartPrice': globalss.InstrumentsPrice,
'CartName':globalss.InstrumentsName,
'CartQuantity':quantity.toString(),
'CartImage':globalss.InstrumentsImage
 });

 var res= await http.post(Uri.parse(globalss.IP+"/tasks/data"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + globalss.authToken 

  }, body: body1);
if(mounted){
  if(res.statusCode==200){
   print(res.body);
    print("Ok");
  }

  }
if(res.statusCode==400){
    if(res.body=="NO"){
      print("hi");
    }
     else if(res.body=="Over"){
      print("hi1");
    }
    else {
      print("hi11");
    }
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 35,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: black.withOpacity(0.1),
                  spreadRadius: 1,
                )
              ],
              borderRadius: BorderRadius.circular(30),
              color: Color.fromARGB(255, 231, 241, 241),
            ),
            child: Stack(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
              FadeInDown(
            delay: Duration(milliseconds: 300),
            child: Image(image:
            MemoryImage(base64Decode("${globalss.InstrumentsImage}"))

            )
          ),
                Positioned(
                  top: 30,
                  left: 10,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: black,
                        size: 30,
                      ),
                      onPressed: () {
                          
                      }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FadeInDown(
            delay: Duration(milliseconds: 300),
            child: Image.asset(
              "images/Logo.png",
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FadeInDown(
            delay: Duration(milliseconds: 350),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                widget.name,
                style: TextStyle(
                    fontSize: 35, fontWeight: FontWeight.w600, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FadeInDown(
            delay: Duration(milliseconds: 400),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                  "${(globalss.InstrumentsPrice)}",
                style: TextStyle(
                    fontSize: 35, fontWeight: FontWeight.w500, height: 1.5),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FadeInDown(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => setState(() {
                    final newValue = _currentIntValue - 1;

                    _currentIntValue = newValue.clamp(0, 100);
                       var Split = PRICEE0.split("\$");
                        double c =int.parse(Split[0]) / 2;
                        globalss.InstrumentsPrice=c.toString()+"\$";
                   
                  }),
                ),
                Text(
                  'Number of items: $_currentIntValue',
                  style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => setState(() {
                    final newValue = _currentIntValue + 1;
                    _currentIntValue = newValue.clamp(0, 100);
                    var Split = PRICEE0.split("\$");
                    
                        int c =int.parse(Split[0]) *_currentIntValue;
                        globalss.InstrumentsPrice=c.toString() + "\$";
                        min=globalss.InstrumentsPrice=c.toString() + "\$";
                         
                  }), 
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FadeInDown(
            delay: Duration(milliseconds: 550),
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0.5,
                              blurRadius: 1,
                              color: black.withOpacity(0.1))
                        ],
                        color: grey),
                    child: Center(
                        child: IconButton(
                      icon: fav_bool? Icon(FontAwesomeIcons.solidHeart,color: Colors.red,):Icon(FontAwesomeIcons.heart),
                      onPressed: () {
                        setState(() {
                          fav_bool = !fav_bool;
                        });
                      },
                    )),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: Colors.pink[600],
                          onPressed: () {
                            sendData(_currentIntValue);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartPage()));
                          },
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                "ADD TO CART",
                                style: TextStyle(
                                    color: white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ))),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
  

}

