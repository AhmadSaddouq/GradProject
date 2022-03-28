import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:sara_music/Screens/Booking.dart';
import 'package:sara_music/Screens/Category.dart';
import 'package:sara_music/Screens/Details_screen.dart';
import 'package:sara_music/Screens/MyDrawer.dart';
import 'package:sara_music/Screens/Shop.dart';
import 'package:sara_music/Screens/Profile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class THomepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return THomepageState();
  }
}

class THomepageState extends State<THomepage> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      drawer: MyDrawer(),
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Image.asset(
                    'images/icons-menu.png',
                    height: 30,
                  ),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                AdvancedAvatar(
                  size: 50,
                  image: AssetImage('images/Logo.png'),
                  foregroundDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text("Hi Ehab,",
                style: GoogleFonts.sansita(
                    fontSize: 32, fontWeight: FontWeight.w600)),
            Text(
              "Find a course you want to learn",
              style: GoogleFonts.sansita(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories",
                    style: GoogleFonts.sansita(
                        fontSize: 20, fontWeight: FontWeight.w600)),
                InkWell(
                  child: Text("See all",
                      style: GoogleFonts.sansita(
                          fontSize: 18, color: Colors.blue)),
                  onTap: () {
                    Navigator.of(context).pushNamed("Categories");
                  },
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (categories[index].name == "Guitar") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details_Screen()));
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: index.isEven ? 300 : 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            categories[index].name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              height: 1,
                            ),
                          ),
                          Text(
                            '${categories[index].numOfCourses} Courses',
                            style: TextStyle(
                              color: Color(0xFF0D1333).withOpacity(.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
