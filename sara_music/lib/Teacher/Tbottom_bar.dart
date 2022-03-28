import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:math' as math;
import '../Screens/MyDrawer.dart';
import 'TAppointment.dart';
import 'THomepage.dart';
import 'TSearch.dart';
import 'TProfile.dart';

class Tbottom_bar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Tbottom_barState();
  }
}

class Tbottom_barState extends State<Tbottom_bar> {
  List<Map<String, Widget>> _pages = [
    {
      'page': THomepage(),
    },
    {
      'page': TAppointment(),
    },
    {
      'page': TSearch(),
    },
    {
      'page': TProfile(),
    },
  ];
  int _selectedPageIndex = 0;

  void intState() {
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: DRawer(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border(top: BorderSide(color: Colors.grey, width: 0.5))),
            child: BottomNavigationBar(
              selectedFontSize: 13,
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Color.fromARGB(255, 46, 23, 172),
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(LineIcons.home),
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.calendarPlus),
                  label: "Appointment",
                ),
                BottomNavigationBarItem(
                    icon: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Icon(
                          LineIcons.search,
                        )),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(LineIcons.user), label: "Profile"),
              ],
            ),
          ),
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
