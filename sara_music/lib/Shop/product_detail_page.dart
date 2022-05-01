// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cart_page.dart';
import 'colors.dart';
import 'product_slider.dart';

class ProductDetailPage extends StatefulWidget {
  final String id;
  final String name;
  final String img;
  final String price;
  final List<String> mulImg;
  final List sizes;

  const ProductDetailPage(
      {Key? key,
      required this.id,
      required this.name,
      required this.img,
      required this.price,
      required this.mulImg,
      required this.sizes})
      : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _currentIntValue = 0;
  int activeSize = 0;
  bool fav_bool = false;
  void intState() {
    super.initState();
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
                  child: ProductSlider(
                    items: widget.mulImg,
                  ),
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
                        Navigator.pop(context);
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
                "\$ " + widget.price,
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
