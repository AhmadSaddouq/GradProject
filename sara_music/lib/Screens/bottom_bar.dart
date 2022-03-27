import 'package:flutter/material.dart';
import 'package:sara_music/Screens/Search.dart';
import 'package:line_icons/line_icons.dart';
import 'Booking.dart';
import 'package:sara_music/Screens/Homepage.dart';
import 'Profile.dart';
import 'Shop.dart';

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
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    "ES",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                accountName:
                    Text("Ehab", style: TextStyle(color: Colors.black)),
                accountEmail: Text("Ehab@gmail.com",
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
              contentPadding: EdgeInsets.only(left: 28),
              horizontalTitleGap: 1,
              title: Text(
                "Log out",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.black,
                size: 28,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
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
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Colors.pink.shade400,
              currentIndex: _selectedPageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.calendarPlus),
                  label:"Booking",
                ),
                BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                   label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.addToShoppingCart),
                   label: "Shop",
                ),
                BottomNavigationBarItem(
                  icon: Icon(LineIcons.user),
                   label: "Profile",
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
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
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
