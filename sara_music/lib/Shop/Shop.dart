import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'product_data.dart';
import 'cart_page.dart';
import 'colors.dart';
import 'product_detail_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:sara_music/globalss.dart';



class Shop extends StatefulWidget {
  @override
  ShopState createState() => ShopState();
}

class ShopState extends State<Shop> {
  @override
var count="0";
late Future coun;

  Future InstrumentsCount() async{
try{
   var res= await http.post(Uri.parse(globalss.IP+"/Instruments/count"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',

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
///
var InstrumentsDes="";
late Future Ind;
var arrI;
var InstrumentsDess=[];
// Future InstrumentDes() async{
//   try{
//   var res= await http.post(Uri.parse(globalss.IP+"/Instruments/Des"),headers: {
//       'Content-Type': 'application/json; charset=UTF-8',

//   });
// if(mounted){
//   if(res.statusCode==200){
//      InstrumentsDes = res.body;
//   }
     
//     }
//      var IN = InstrumentsDes.toString();
//       arrI=IN.split(",");
//       for(int i = 0; i<int.parse(count);i++){
//       InstrumentsDess.add(arrI[i]);

// }
//   }catch(e){
//     print(e);
//   }
      
// return await [InstrumentsDess];
// }


///

var InstrumentPrice="";
var arrp;
late Future Pr;
var InstrumentPric=[];
Future InstrumentPri() async{
  var res= await http.post(Uri.parse(globalss.IP+"/Instruments/price"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',

  });
if(mounted){
  if(res.statusCode==200){
     InstrumentPrice = res.body;
  }
     
    }
     var InstrumentPricee = InstrumentPrice.toString();
      arrp=InstrumentPricee.split(",");
      if(int.parse(count)!=0){
      for(int i = 0; i<int.parse(count);i++){
     InstrumentPric.add(arrp[i]);

}
      
      }
return await [InstrumentPric];
}


////

var InstrumentNa="";
var arrC;
var InstrumentsName=[];
late Future Na;
Future InstrumentName() async{
  try{
  var res= await http.post(Uri.parse(globalss.IP+"/Instruments/getName"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',

  });
if(mounted){
  if(res.statusCode==200){
     InstrumentNa = res.body;
  }
     
    }
     var INSN = InstrumentNa.toString();
      arrC=INSN.split(",");
      if(int.parse(count)!=0){
      for(int i = 0; i<int.parse(count);i++){
      InstrumentsName.add(arrC[i]);

}
      }
      }catch(e){
        print(e);
      }
return await [InstrumentsName];
}
var Imagess="";
var InstrumentsImage=[];
var arrImage;
late Future Im;
Future InstruemntImage() async{
  try{
  var res= await http.post(Uri.parse(globalss.IP+"/Instruments/getImage"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',

  });
  if(mounted){
    if(res.statusCode==200){
      Imagess=res.body;
    }
  }
  var ii = Imagess.toString();
  arrImage = ii.split(",");
  if(int.parse(count)!=0){

    for(int i = 0; i<int.parse(count);i++){
      InstrumentsImage.add(arrImage[i]);

}
  }
  }catch(e){
    print(e);
  }
return await [InstrumentsImage];
}
void initState(){
  super.initState();
    coun=InstrumentsCount();

  Na=InstrumentName();
  Im=InstruemntImage();
    Pr=InstrumentPri();

  // Ind=InstrumentDes();
}
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
       Waitforme()
      ],
    );
  }
    Widget Waitforme() {
  
  return FutureBuilder( future: coun, builder:((context, snapshot)  {

      return snapshot.data==null||int.parse(count)<=0||InstrumentsImage.length<=0?  Center(child: CircularProgressIndicator()): 
     
   Column(children: List.generate(int.parse(count), (index){
          return FadeInDown(
            duration: Duration(milliseconds: 350 * index),
                      child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: InkWell(
              onTap: (){
                 globalss.InstrumentsName="${InstrumentsName[index]}";
                globalss.InstrumentsPrice="${InstrumentPric[index]}";
                globalss.InstrumentsImage=InstrumentsImage[index];                 
                Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailPage(

                  id: products[index]['id'].toString(),
                  name: globalss.InstrumentsName,
                  img: products[index]['img'],
                  price: globalss.InstrumentsPrice,
                  image: globalss.InstrumentsImage,
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
                                image: DecorationImage(image:
                                 MemoryImage(base64Decode("${InstrumentsImage[index]}")
                                
                                ),fit: BoxFit.fill)
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text("${InstrumentsName[index]}",style: TextStyle(
                            fontSize:17,
                            fontWeight: FontWeight.w600
                          ),),
                          SizedBox(height: 30,),
                          
                          Text(
                        "${InstrumentPric[index]}"
                          ,style: TextStyle(
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
        }));

  }));
}
    
}