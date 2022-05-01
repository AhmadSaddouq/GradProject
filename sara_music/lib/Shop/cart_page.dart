import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sara_music/Screens/Details_screen.dart';
import 'package:sara_music/Shop/Shop.dart';
import 'package:sara_music/Shop/product_detail_page.dart';
import 'product_data.dart';
import 'colors.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
              onPressed: () {},
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
