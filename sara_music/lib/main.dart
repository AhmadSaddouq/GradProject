import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sara_music/Admin/screens/dashboard/Add_New.dart';
import 'package:sara_music/Admin/screens/dashboard/dashboard_screen.dart';
import 'package:sara_music/Screens/Categories_Screen.dart';
import 'package:sara_music/Screens/Category.dart';
import 'package:sara_music/Screens/Details_screen.dart';
import 'package:sara_music/Screens/MyDrawer.dart';
import 'package:sara_music/Screens/Profile.dart';
import 'package:sara_music/Screens/Settings_Page.dart';
import 'package:sara_music/Screens/bottom_bar.dart';
import 'package:sara_music/Teacher/TDetails.dart';
import 'package:sara_music/authi/ForgetPassword.dart';
import 'package:sara_music/authi/ResetPassword.dart';
import 'package:sara_music/authi/Verify.dart';
import 'package:sara_music/authi/login.dart';
import 'package:sara_music/authi/Signup.dart';
import 'package:sara_music/Screens/Homepage.dart';
import 'package:sara_music/authi/IntroPage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:sara_music/Admin/screens/home/home_screen.dart';
import 'Admin/core/init/provider_list.dart';
import 'Teacher/Tbottom_bar.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  

  runApp(const MyApp());
}
Widget build(BuildContext context) {
  return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: FutureBuilder(
        builder: (context, snapshot) {
          return MyApp();
        },
      ));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: ThemeData(
          textTheme: GoogleFonts.sansitaTextTheme(Theme.of(context).textTheme),
          primaryColor: Colors.pink[600],
          buttonColor: Colors.pink[600],
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Color.fromARGB(255, 231, 241, 241),
              labelStyle: TextStyle(color: Colors.grey.shade800),
              iconColor: Colors.pink.shade600,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.pink.shade600),
              ))),
      routes: {
        "login": (context) => Login(),
        "Signup": (context) => Signup(),
        "ForgetPassword": (context) => ForgetPassword(),
        "HomePage": (context) => Homepage(),
        "Bottom_bar": (context) => bottom_bar(),
        "Categories": (context) => Categories_Screen(),
        "ResetPass": (context) => ResetPassword(),
        "Settings": (context) => Settings_Page(),
      },
    );
  }
}
