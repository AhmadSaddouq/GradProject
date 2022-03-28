import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sara_music/Screens/Search.dart';
import 'package:line_icons/line_icons.dart';
import 'Booking.dart';
import 'package:sara_music/Screens/Homepage.dart';
import 'Profile.dart';
import 'Shop.dart';
import 'MyDrawer.dart';
import 'dart:math' as math;

class bottom_bar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return bottom_barState();
  }
}

class bottom_barState extends State<bottom_bar> {
  List<Map<String, Widget>> _pages = [
    {
      'page': Homepage(),
    },
    {
      'page': Booking(),
    },
    {
      'page': Search(),
    },
    {
      'page': Shop(),
    },
    {
      'page': Profile(),
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
              selectedItemColor: Colors.pink.shade400,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(LineIcons.home),
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.calendarPlus),
                  label: "Booking",
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
                    icon: Icon(LineIcons.addToShoppingCart), label: "Shop"),
                BottomNavigationBarItem(
                    icon: Icon(LineIcons.user), label: "Profile"),
              ],
            ),
          ),
        ),
      ),
      /*floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
            hoverElevation: 10,
            hoverColor: Colors.pink.shade600,
            splashColor: Colors.grey,
            elevation: 4,
            child: Icon(
              Icons.search,
            ),
            tooltip: 'Search',
            onPressed: () {
              setState(() {
                _selectedPageIndex = 2;
              });
            }),
      ),*/
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
