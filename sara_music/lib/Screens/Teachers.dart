import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sara_music/Screens/Category.dart';
import 'package:sara_music/Screens/bottom_bar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Teachers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TeachersState();
  }
}

class TeachersState extends State<Teachers> {
  List teacher = [
    "Ehab Sarrawi",
    "Mahmoud Saddouq",
    "Ahmad Sadouq",
    "Khaled Saddouq",
    "Mohammod Saddouq",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10),
                  child: InkWell(
                    child: Image.asset(
                      'images/icons-back.png',
                      height: 30,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => bottom_bar()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
                  child: Text(
                    'Reset Password',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 580,
              child: ListView.separated(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.symmetric(horizontal: 24),
                itemCount: teacher.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(indent: 16),
                itemBuilder: (BuildContext context, int index) => Container(
                  width: 283,
                  height: 199,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 231, 241, 241),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 77,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 84, 153),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(32)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${teacher[index]}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              categories[index].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 2.5,
                                ),
                                Text(
                                  "4.5",
                                  style: GoogleFonts.sansita(
                                      color: Color.fromARGB(255, 58, 57, 57)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                SmoothStarRating(
                                  size: 20,
                                  rating: 5,
                                  defaultIconData: Icons.star,
                                  starCount: 1,
                                  color: Colors.yellow,
                                  borderColor: Colors.yellow,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 77,
                          height: 54,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 84, 153),
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(32)),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 80,
                        top: 0,
                        child: SizedBox(
                          width: 100,
                          height: 140,
                          child: Hero(
                            tag: "${teacher[index]}",
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 80,
                              child: CircleAvatar(
                                radius: 48,
                                backgroundImage: AssetImage('images/ehab.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
