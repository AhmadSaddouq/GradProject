import 'package:flutter/material.dart';
import 'package:sara_music/authi/login.dart';
import 'package:sara_music/globalss.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DRawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
               


    return MyDrawer();
  }
}
class MyDrawer extends State<DRawer> {
   var NAME1;
   var EMAIL1;
   var SHORT;
Future  logout() async{
    
    var res= await http.post(Uri.parse(globalss.IP+"/users/logout"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });
  if(res.statusCode==200){
    if(mounted){
     print(res.statusCode);

 Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                               Login ()));
    }
   
  }
   
  }

  Future  SETNAME1() async{
    
    var res= await http.get(Uri.parse(globalss.IP+"/tasks/name"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });
     print(res.statusCode);
  if(res.statusCode==201){
    if(mounted){
 setState(() {
     NAME1=res.body;
    });
    }
   
  }
   
    return NAME1;
  }
   Future  SETEMAIL() async{
    
    var res= await http.get(Uri.parse(globalss.IP+"/tasks/email"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });
     print(res.statusCode);
  if(res.statusCode==201){
    if(mounted){
 setState(() {
     EMAIL1=res.body;
    });
    }
   
  }
   
    return EMAIL1;
  }

   Future  SETSHORT() async{
    
    var res= await http.get(Uri.parse(globalss.IP+"/tasks/short"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });
     print(res.statusCode);
  if(res.statusCode==201){
    if(mounted){
 setState(() {

     SHORT=res.body;
    });
    }
   
  }
   
    return SHORT;
  }
  @override
  Widget build(BuildContext context) {

        SETNAME1();
        SETEMAIL();
        SETSHORT();




    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Text(
                  "${SHORT}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              accountName:
                  Text("${NAME1}", style: TextStyle(color: Colors.black)),
              accountEmail: Text("${EMAIL1}",
                  style: TextStyle(color: Colors.black))),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            horizontalTitleGap: 1,
            title: Text(
              "Home page",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            leading: Icon(
              IconData(0xf107, fontFamily: 'MaterialIcons'),
              color: Colors.black,
              size: 28,
            ),
            onTap: () {},
            selected: false,
            selectedColor: Color(0xFFcb1772),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            horizontalTitleGap: 1,
            title: Text(
              "Help",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            leading: Icon(
              Icons.help_outline,
              color: Colors.black,
              size: 28,
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            horizontalTitleGap: 1,
            title: Text(
              "About",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            leading: Icon(
              Icons.error_outline,
              color: Colors.black,
              size: 28,
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 25),
            horizontalTitleGap: 1,
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.black,
              size: 28,
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30),
            horizontalTitleGap: 1,
            title: Text(
              "Log out",
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
            leading: Icon(
              Icons.logout_outlined,
              color: Colors.red,
              size: 28,
            ),
            onTap: () {

              logout();
            },
          ),
        ],
      ),
    );
  }
}
