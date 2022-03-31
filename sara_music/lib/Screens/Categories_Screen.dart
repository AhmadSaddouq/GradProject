import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Category.dart';

class Categories_Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Categories_ScreenState();
  }
}

class Categories_ScreenState extends State<Categories_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                InkWell(
                  child: Image.asset(
                    'images/icons-back.png',
                    height: 25,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed("Bottom_bar");
                  },
                ),
                SizedBox(
                  width: 85,
                ),
                Text("Categories",
                    style: GoogleFonts.sansita(
                        fontSize: 24, fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 2, top: 10, bottom: 10),
                    padding: EdgeInsets.all(20),
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.transparent),
                        boxShadow: [BoxShadow(blurRadius: 1)]),
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
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
