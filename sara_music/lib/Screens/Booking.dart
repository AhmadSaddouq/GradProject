import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import 'package:sara_music/Screens/Category.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';

class Booking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BookingState();
  }
}

class BookingState extends State<Booking> {
  List teacher = [
    "Ehab Sarrawi",
    "Mahmoud Saddouq",
    "Ahmad Sadouq",
    "Khaled Saddouq",
    "Mohammod Saddouq",    
  ];
  bool _verticalList = false;
  var instrument = 0;
  ScrollController _scrollController = ScrollController();
  DateTime _selectedDate = DateTime.now();
  int value = 0;
  Widget CustomRadioButton(String text, int index) {
    return OutlineButton(
      onPressed: () {
        setState(() {
          value = index;
        });
      },
      color: Colors.pink[600],
      hoverColor: Colors.pink,
      padding: EdgeInsets.all(15),
      child: Text(
        text,
        style: TextStyle(
          color: (value == index) ? Colors.pink.shade600 : Colors.black,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      borderSide: BorderSide(
          width: 3,
          color: (value == index) ? Colors.pink.shade600 : Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
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
                    'Booking',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                'Choose a Date',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.grey[700]),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color(0xffb4dbd8),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  CalendarTimeline(
                    showYears: true,
                    initialDate: _selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                    onDateSelected: (date) {
                      setState(() {
                        _selectedDate = date!;
                      });
                    },
                    leftMargin: 20,
                    monthColor: Colors.black,
                    dayColor: Colors.black,
                    dayNameColor: Colors.white,
                    activeDayColor: Colors.white,
                    activeBackgroundDayColor: Colors.pink[600],
                    dotsColor: Colors.white,
                    selectableDayPredicate: (date) => date.day != 23,
                    locale: 'en',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffb4dbd8),
                  borderRadius: BorderRadius.circular(30)),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 10,
                children: [
                  CustomRadioButton("9-10 am", 1),
                  CustomRadioButton("10-11 am", 2),
                  CustomRadioButton("11-12 am", 3),
                  CustomRadioButton("12-1 pm", 4),
                  CustomRadioButton("1-2 pm", 5),
                  CustomRadioButton("2-3 pm", 6),
                  CustomRadioButton("3-4 pm", 7),
                  CustomRadioButton("4-5 pm", 8),
                  CustomRadioButton("5-6 pm", 9),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                'Choose an instrument',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.grey[700]),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 650,
              child: VsScrollbar(
                controller: _scrollController,
                showTrackOnHover: true,
                isAlwaysShown: false,
                scrollbarFadeDuration: Duration(milliseconds: 500),
                scrollbarTimeToFade: Duration(milliseconds: 800),
                style: VsScrollbarStyle(
                  hoverThickness: 10.0,
                  radius: Radius.circular(10),
                  thickness: 5.0,
                  color: Colors.purple.shade900,
                ),
                child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection:
                        _verticalList ? Axis.vertical : Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      Color? color = Colors.pink[600];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            instrument = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text(
                                  categories[index].name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: instrument == index
                                        ? Colors.white
                                        : Colors.black,
                                    height: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  child: AdvancedAvatar(
                                    size: 40,
                                    image: AssetImage('images/Logo.png'),
                                    foregroundDecoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Text(
                                  "${teacher[index]}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(                                   
                                    fontSize: 13,
                                    color: instrument == index
                                        ? Colors.white
                                        : Colors.black,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                            height: 50,
                            width: MediaQuery.of(context).size.width - 300,
                            decoration: BoxDecoration(
                                color: instrument == index
                                    ? color
                                    : Color(0xffb4dbd8),
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.only(
                                left: 10, right: 10, bottom: 20)),
                      );
                    }),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 15, bottom: 50),
              child: ElevatedButton(
                child: Text("Booking Now"),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[600],
                  onPrimary: Colors.white,
                  minimumSize: const Size(150, 40),
                  textStyle: TextStyle(
                    fontSize: 18,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 110),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
