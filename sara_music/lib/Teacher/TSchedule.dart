// import 'package:flutter/material.dart';

// class TAppointment extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return TAppointment_State();
//   }
// }

// class TAppointment_State extends State<TAppointment> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
import 'package:flutter/material.dart';


class TSchedule extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return TScheduleState();
  }
}

enum FilterStatus { Upcoming, Complete, Cancel }

List<Map> schedules = [
  {
    'img': 'images/ehab.jpg',
    'StudentName': 'Ramy Tubileh',
    'instrument': 'Violin',
    'reservedDate': 'Monday, Aug 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Upcoming
  },
  {
    'img': 'images/ehab.jpg',
    'StudentName': 'Adel Halaweh',
    'instrument': 'Violin',
    'reservedDate': 'Monday, Sep 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Upcoming
  },
  {
    'img': 'images/ehab.jpg',
    'StudentName': 'Yasser Fathi',
    'instrument': 'Violin',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Upcoming
  },
  {
    'img': 'images/ehab.jpg',
    'StudentName': 'Amr AboAmr',
    'instrument': 'Violin',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Complete
  },
  {
    'img': 'images/ehab.jpg',
    'StudentName': 'Mustafa Wajdi',
    'instrument': 'Violin',
    'reservedDate': 'Monday, Feb 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Cancel
  },
  {
    'img': 'images/ehab.jpg',
    'StudentName': 'Mohammad Kukhun',
    'instrument': 'Violin',
    'reservedDate': 'Monday, Jul 29',
    'reservedTime': '11:00 - 12:00',
    'status': FilterStatus.Cancel
  },
];

class TScheduleState extends State<TSchedule> {
  FilterStatus status = FilterStatus.Upcoming;
  Alignment _alignment = Alignment.centerLeft;

late bool _isButtonDisabled;

  @override
  void initState() {
    _isButtonDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    List<Map> filteredSchedules = schedules.where((var schedule) {
      return schedule['status'] == status;
    }).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
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
                    'Schedule',
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
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(MyColors.bg),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.Upcoming) {
                                  status = FilterStatus.Upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.Complete) {
                                  status = FilterStatus.Complete;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.Cancel) {
                                  status = FilterStatus.Cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(
                                filterStatus.name,
                                style: TextStyle(
                                  color: Color(MyColors.header01),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  duration: Duration(milliseconds: 200),
                  alignment: _alignment,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(MyColors.primary),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: (context, index) {
                  var _schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    margin: !isLastElement
                        ? EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(_schedule['img']),
                                radius: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _schedule['StudentName'],
                                    style: TextStyle(
                                        color: Color(MyColors.header01),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _schedule['instrument'],
                                    style: TextStyle(
                                      color: Color(MyColors.grey02),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(MyColors.bg03),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.all(20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_today,
                                      color: Color(MyColors.primary),
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      _schedule["reservedDate"],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(MyColors.primary),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_alarm,
                                      color: Color(MyColors.primary),
                                      size: 17,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      _schedule["reservedTime"],
                                      style: TextStyle(
                                        color: Color(MyColors.primary),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          _schedule["status"] == FilterStatus.Upcoming
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        child: Text('Cancel'),
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        child: Text('Reschedule'),
                                        onPressed: () => {},
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _schedule["status"] == FilterStatus.Complete?
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        label: Text('Successed',style: TextStyle(color: Colors.green),),
                                          icon: Icon(Icons.check_circle,color: Colors.green,),
                                        onPressed: () {
                                          _isButtonDisabled;
                                        },
                                      ),
                                    )
                                    :Expanded(child: OutlinedButton.icon(
                                      label: Text('Canceled',), 
                                      icon: Icon(Icons.cancel,color: Colors.red,),                                       
                                        onPressed: () {
                                          _isButtonDisabled;
                                        },
                                      ),),                                   
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red),
                                        child: Text('Delete'),
                                        onPressed: () => {},
                                      ),
                                    ),
                                    
                                  ],
                                )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyColors {
  static int header01 = 0xff151a56;
  static int primary = 0xff575de3;
  static int purple01 = 0xff918fa5;
  static int purple02 = 0xff6b6e97;
  static int yellow01 = 0xffeaa63b;
  static int yellow02 = 0xfff29b2b;
  static int bg = 0xfff5f3fe;
  static int bg01 = 0xff6f75e1;
  static int bg02 = 0xffc3c5f8;
  static int bg03 = 0xffe8eafe;
  static int text01 = 0xffbec2fc;
  static int grey01 = 0xffe9ebf0;
  static int grey02 = 0xff9796af;
}
