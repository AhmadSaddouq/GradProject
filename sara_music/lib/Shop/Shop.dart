import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'product_data.dart';
import 'cart_page.dart';
import 'colors.dart';
import 'product_detail_page.dart';




class Shop extends StatefulWidget {
  @override
  ShopState createState() => ShopState();
}

class ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: getBody(),
    );
  }
  
  Widget getBody(){
    return ListView(
      children: <Widget>[  
         Row(
              children: [
                SizedBox(width: 10,),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: InkWell(
                    child: Image.asset(
                      'images/icons-menu.png',
                      height: 30,
                    ),
                    onTap: () {
                      Scaffold.of(context).openDrawer();                     
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
                  child: Text(
                    'Shop',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.black),
                  ),
                ),
                
              ],
            ),  
        SizedBox(height: 30,),
        Column(children: List.generate(products.length, (index){
          return FadeInDown(
            duration: Duration(milliseconds: 350 * index),
                      child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(
                  id: products[index]['id'].toString(),
                  name: products[index]['name'],
                  img: products[index]['img'],
                  price: products[index]['price'],
                  mulImg: products[index]['mul_img'],
                  sizes: products[index]['sizes'],
                )));
              },
                          child: Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 231, 241, 242),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                          spreadRadius: 1,
                          color: black.withOpacity(0.1),
                          blurRadius: 2
                        )]
                      ),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: 280,
                              height: 180,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(products[index]['img']),fit: BoxFit.fill)
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text(products[index]['name'],style: TextStyle(
                            fontSize:17,
                            fontWeight: FontWeight.w600
                          ),),
                          SizedBox(height: 15,),
                          Text("\$ "+products[index]['price'],style: TextStyle(
                            fontSize:16,
                            fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 25,)
                        ],
                        
                      ),
                    ),
                    
                  ],
                )
              ),
            ),
        ),
          );
        }))
      ],
    );
  }
}