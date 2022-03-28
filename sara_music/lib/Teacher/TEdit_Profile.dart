import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sara_music/Screens/Profile.dart';
import 'package:sara_music/Screens/bottom_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as file;
import 'dart:async';

import '../Screens/Settings_Page.dart';


class TEdit_Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TEdit_ProfileState();
  }
}

class TEdit_ProfileState extends State<TEdit_Profile> {
  late file.File imagepicker;
  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagepicker = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
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
                          child: bottom_bar(),
                          duration: Duration(milliseconds: 1000),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
                  child: Text(
                    'Edit Profile',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.black),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 15, left: 130),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Settings_Page()));
                      },
                      icon: Icon(Icons.settings),
                      alignment: Alignment.centerRight,
                      iconSize: 30,
                    )),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: CircleAvatar(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () => getImageFromGallery(),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 46, 23, 172),
                      radius: 25,
                      child: Icon(Icons.edit,color: Colors.white,),
                    ),
                  ),
                ),
                radius: 90,
                backgroundImage: AssetImage('images/ehab.jpg'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Username",
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 4),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 46, 23, 172), width: 5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "About",
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 4),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 46, 23, 172), width: 5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Education",
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 4),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 46, 23, 172), width: 5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlineButton(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {},
                        child: Text("CANCEL",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.black)),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        color: Color.fromARGB(255, 46, 23, 172),
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
