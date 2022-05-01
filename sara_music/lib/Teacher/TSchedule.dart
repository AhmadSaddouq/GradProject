<<<<<<< HEAD
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
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';
import 'package:sara_music/globalss.dart';


import 'dart:convert';
import 'package:http/http.dart' as http;
=======
import 'package:flutter/material.dart';
import 'package:sara_music/Shop/colors.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:time_range/time_range.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
>>>>>>> efa5fbede75cb57b3a0c19e0d31aba98f76d659c

class TSchedule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TScheduleState();
  }
}



enum FilterStatus { Upcoming, Complete, Cancel }


class TScheduleState extends State<TSchedule> {
<<<<<<< HEAD
=======
  final _defaultTimeRange = TimeRangeResult(
    TimeOfDay(hour: 9, minute: 00),
    TimeOfDay(hour: 10, minute: 00),
  );
  TimeRangeResult? _timeRange;
>>>>>>> efa5fbede75cb57b3a0c19e0d31aba98f76d659c

  FilterStatus status = FilterStatus.Upcoming;
  Alignment _alignment = Alignment.centerLeft;
  late bool _isButtonDisabled;
  late Future NAM;
  late Future DAT;
  late Future TIM;
  late Future COU;
  late Future CCSS;
  late Future ALLD;
  late Future CO;
  var count12="";
  List DATES = [];
  late Future A;
  late Future B;
  List Times = [];
  List NAMES = [];
  int q=0;
  var s= "";
  var d;
  var names = "";
  var dates = "";
  var times = "";
  var NA;
  var TA;
  var DA;
  List<Map> schedules = [];

  var ALL1="";
  var countS = "";
  int pressed = 0;
  var StatusTT = "";
  var c = "";
  var ars;
  var counttt="";
  
  var a = "";
  var a1;
  var b = "";
  var b1;
Future SENDTOCANCEL(var get)async{
try{

var body1 = jsonEncode({
  "Name": get["StudentName"],
  "Time" : get['reservedTime'],
  "Date": get['reservedDate']
});

   var res= await http.post(Uri.parse(globalss.IP+"/Ttasks/CANCEL"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  }, body: body1);
  print(res.body);
if(res.statusCode==200){

}
} catch(e){
  print(e);
}
}

//--NumberOfStudents
Future STUCOUNT() async {
  try{

 var res= await http.get(Uri.parse(globalss.IP+"/Ttasks/COUNTS"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });

 if(mounted){
  if(res.statusCode==200){
   setState(() {
   countS = res.body;

   });
  }
 }
  

return await [int.parse(countS)];
  } catch(e){
    print(e);
  }

}
//--

Future STUC() async {
  try{
 var res= await http.get(Uri.parse(globalss.IP+"/Ttasks/COUNTSC"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });

 if(mounted){
  if(res.statusCode==200){
   setState(() {
   counttt = res.body;

   });
  }
 }

return await [int.parse(counttt)];
  } catch(e){
    print(e);
  }

}
//---StudentsNAMES
Future StudentsList() async {
// STUCOUNT();
try{

 var res= await http.get(Uri.parse(globalss.IP+"/Ttasks/ListN"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });

 if(mounted){
  if(res.statusCode==201){
   setState(() {
   names = res.body;

   });
  }
 }
 
    var names1 =  names.toString();
    NA =  names1.split(",");
    if(countS!=""){
    for(int i = 0; i<int.parse(countS);i++){
      if(NA[i]==""){
        continue;
      }
      NAMES.add( NA[i]);
    }

return await [NAMES];
    } 
} catch(e){
  print(e);
}
}
//--StudentsTime
Future TimesList() async {
try{
DateTime selectdate = DateTime.now();

 var res= await http.get(Uri.parse(globalss.IP+"/Ttasks/ListS"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });

if(countS!=0){
  for(int k = 0 ;k<int.parse(countS);k++){
  var datess = DATES[k].toString();
var month = datess.toString();
var arrmonth = month.split("-");
var days1 = arrmonth.toString();
var arrdays = days1.split(" "); 

 if(int.parse(arrmonth[1])>=selectdate.toLocal().month.toInt()){
 if(int.parse(arrdays[2])>=selectdate.toLocal().day.toInt()){
   
 
 if(mounted){
  if(res.statusCode==201){
   setState(() {
   times = res.body;

   });
  }
 }

    var times1 =  await times.toString();

    TA =  times1.split(",");
    Times.add(TA[k]);
    
      schedules.add({
           'img': 'images/ehab.jpg',
    'StudentName': NAMES[k],
    'instrument': ALL1,
    'reservedDate': DATES[k],
    'reservedTime': Times[k],
    'status': FilterStatus.Upcoming
  
      });
      
}
else{
if(mounted){
  if(res.statusCode==201){
   setState(() {
   times = res.body;

   });
  }
 }

    var times1 =  times.toString();
    TA =  times1.split(",");
      Times.add(TA[k]);
    
      schedules.add({
           'img': 'images/ehab.jpg',
    'StudentName': NAMES[k],
    'instrument': ALL1,
    'reservedDate': DATES[k],
    'reservedTime': Times[k],
    'status': FilterStatus.Complete
  
      });
      Completed(NAMES[k]);
      
}

}


else{
if(mounted){
  if(res.statusCode==201){
   setState(() {
   times = res.body;

   });
  }
 }

    var times1 =  times.toString();
    TA =  times1.split(",");
      Times.add(TA[k]);
    
      schedules.add({
           'img': 'images/ehab.jpg',
    'StudentName': NAMES[k],
    'instrument': ALL1,
    'reservedDate': DATES[k],
    'reservedTime': Times[k],
    'status': FilterStatus.Complete
  
      });
   
      // var NAMESQ = NAMES[k];
      // var ALL1Q = ALL1;
      // var DATESQ = DATES[k];
      // var TIMESQ = Times[k];
      

  // DeleteAfterComplete(NAMESQ,ALL1Q,DATESQ,TIMESQ);

      
}


<<<<<<< HEAD
  
}
}
  return await [Times,schedules];
}catch(e){
  print(e);
}



}


//---


Future DatesList() async {
// STUCOUNT();
try{
 var res= await http.get(Uri.parse(globalss.IP+"/Ttasks/ListD"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });

 if(mounted){
  if(res.statusCode==201){
   setState(() {
   dates = res.body;

   });
  }
 }
 
    var dates1 =  dates.toString();
    DA =  dates1.split(",");
    if(countS!=""){
    for(int i = 0; i<int.parse(countS);i++){
      if(DA[i]==""){
        continue;
      }
      DATES.add(DA[i]);
    }
 
return await [DATES];
    }
    }catch(e){
      print(e);
    }
}

//---


//--FetchAllData
Future ALL() async {
  try{
 var res= await http.get(Uri.parse(globalss.IP+"/Ttasks/ALL"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });

 if(mounted){
  if(res.statusCode==200){
  Map<String,dynamic> DB = jsonDecode(res.body);
   setState(() {
   ALL1 = DB['instrument'];

   });
  }
 }
 

return await [ALL1];
  }catch(e){
    print(e);
  }

}


//--

Future ccs() async {
  try{
 var res= await http.get(Uri.parse(globalss.IP+"/Ttasks/CCS"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });

 if(mounted){
  if(res.statusCode==200){
   setState(() {
   c = res.body;

   });

  }
 }
 
    var cc1 =  c.toString();
    ars =  cc1.split(",");
    if(counttt!=""){
    for(int i = 0; i<int.parse(counttt);i++){
      if(ars[i]!=""){
        print(ars[i]);
      schedules.add({
            'img': 'images/ehab.jpg',
    'StudentName': ars[i],
    'instrument': "",
    'reservedDate': "",
    'reservedTime': "",
    'status': FilterStatus.Cancel

      });
    }
    else{
      continue;
    }
    }
    }
 

return await [schedules];}
catch(e){
  print(e);
}

}

Future Completed(var name) async{
try{
var body1 = jsonEncode({
  "Name": name.toString()
});

   var res= await http.post(Uri.parse(globalss.IP+"/Ttasks/COMPS"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  }, body: body1);
 if(res.body==200){

 }
} catch(e){
  print(e);
}
}

Future CompList() async{
  try{
   var res= await http.get(Uri.parse(globalss.IP+"/Ttasks/CCSS"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });
if(mounted){
  if(res.statusCode==200){
   setState(() {
   a = res.body;

   });

  }
 }
 
    var aaa1 =  a.toString();
    a1 =  aaa1.split(",");
    if(count12!=""){
    for(int i = 0; i<int.parse(count12);i++){
      if(a1[i]!=""){
        print(a1[i]);
      schedules.add({
            'img': 'images/ehab.jpg',
    'StudentName': a1[i],
    'instrument': "",
    'reservedDate': "",
    'reservedTime': "",
    'status': FilterStatus.Complete

      });
    }
    else{
      continue;
    }
    }
    }
 

return await [schedules];
  }catch(e){
    print(e);
  }

}
Future CountComp() async{
  try{

   var res= await http.get(Uri.parse(globalss.IP+"/Ttasks/COUNTSCC"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });

 if(mounted){
  if(res.statusCode==200){
   setState(() {
   count12 = res.body;

   });
  }
 }

return await [int.parse(count12)];
  }catch(e){
    print(e);
  }
}
  @override
  void initState() {
      super.initState();

=======
  late bool _isButtonDisabled;
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();
  @override
  void initState() {
    super.initState();
    _timeRange = _defaultTimeRange;
>>>>>>> efa5fbede75cb57b3a0c19e0d31aba98f76d659c
    _isButtonDisabled = false;
        COU = STUCOUNT();
    NAM = StudentsList();
    DAT = DatesList();
    ALLD = ALL();
   TIM = TimesList();
   CO = STUC();
   CCSS = ccs();
   A = CountComp();
  B = CompList();

  }
// List<Map> schedules = [
//   {
//     'img': 'images/ehab.jpg',
//     'StudentName': 'Ramy Tubileh',
//     'instrument': 'Violin',
//     'reservedDate': 'Monday, Aug 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Upcoming
//   },
//   {
//     'img': 'images/ehab.jpg',
//     'StudentName': 'Adel Halaweh',
//     'instrument': 'Violin',
//     'reservedDate': 'Monday, Sep 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Upcoming
//   },
//   {
//     'img': 'images/ehab.jpg',
//     'StudentName': 'Yasser Fathi',
//     'instrument': 'Violin',
//     'reservedDate': 'Monday, Jul 29',
//     'reservedTime': '11:00 - 12:00',
//     'status': FilterStatus.Upcoming
//   },
//   // {
//   //   'img': 'images/ehab.jpg',
//   //   'StudentName': 'Amr AboAmr',
//   //   'instrument': 'Violin',
//   //   'reservedDate': 'Monday, Jul 29',
//   //   'reservedTime': '11:00 - 12:00',
//   //   'status': FilterStatus.Complete
//   // },
//   // {
//   //   'img': 'images/ehab.jpg',
//   //   'StudentName': 'Mustafa Wajdi',
//   //   'instrument': 'Violin',
//   //   'reservedDate': 'Monday, Feb 29',
//   //   'reservedTime': '11:00 - 12:00',
//   //   'status': FilterStatus.Cancel
//   // },
//   // {
//   //   'img': 'images/ehab.jpg',
//   //   'StudentName': 'Mohammad Kukhun',
//   //   'instrument': 'Violin',
//   //   'reservedDate': 'Monday, Jul 29',
//   //   'reservedTime': '11:00 - 12:00',
//   //   'status': FilterStatus.Cancel
//   // },
// ];
        

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
                                        
                                        onPressed: () { 
                                          setState(() {
                                         var get  = schedules[index];
                                         SENDTOCANCEL(get);
                                          });
                                          

                                  
                                        },
                                      ),
                                    ),
                                    
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        child: Text('Reschedule'),
                                        onPressed: () {
                                          _showDialog();
                                        },
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _schedule["status"] == FilterStatus.Complete
                                        ? Expanded(
                                            child: OutlinedButton.icon(
                                              label: Text(
                                                'Successed',
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                              icon: Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                              ),
                                              onPressed: () {
                                                _isButtonDisabled;
                                              },
                                            ),
                                          )
                                        : Expanded(
                                            child: OutlinedButton.icon(
                                              label: Text(
                                                'Canceled',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              icon: Icon(
                                                Icons.cancel,
                                                color: Colors.red,
                                              ),
                                              onPressed: () {
                                                _isButtonDisabled;
                                              },
                                            ),
                                          ),
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

  static const double leftPadding = 50;
  void _showDialog() {
    slideDialog.showSlideDialog(
      context: context,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: leftPadding),
              child: Text(
                'Select New Date',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold, color: Color(MyColors.dark)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: DatePicker(
                DateTime.now(),
                width: 60,
                height: 80,
                controller: _controller,
                initialSelectedDate: DateTime.now(),
                selectionColor: Color(MyColors.primary),
                selectedTextColor: Colors.white,
                inactiveDates: [],
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedValue = date;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: leftPadding),
              child: Text(
                'Select New Time',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold, color: Color(MyColors.dark)),
              ),
            ),
            SizedBox(height: 20),
            TimeRange(
              fromTitle: Text(
                'FROM',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(MyColors.dark),
                  fontWeight: FontWeight.w600,
                ),
              ),
              toTitle: Text(
                'TO',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(MyColors.dark),
                  fontWeight: FontWeight.w600,
                ),
              ),
              titlePadding: leftPadding,
              textStyle: TextStyle(
                fontWeight: FontWeight.normal,
                color: Color(MyColors.dark),
              ),
              activeTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: white,
              ),
              borderColor: Color(MyColors.grey02),
              activeBorderColor: Color(MyColors.grey02),
              backgroundColor: Colors.transparent,
              activeBackgroundColor: Color(MyColors.primary),
              firstTime: TimeOfDay(hour: 9, minute: 00),
              lastTime: TimeOfDay(hour: 18, minute: 00),
              initialRange: _timeRange,
              timeStep: 60,
              timeBlock: 60,
              onRangeCompleted: (range) => setState(() => _timeRange = range),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
                child: ElevatedButton(
                  
              onPressed: () {},
              child: Text("Reschedule"),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 46, 23, 172),
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                textStyle: TextStyle(fontSize: 16)
              ),
            ))
          ],
        ),
      ),
      barrierColor: Colors.white.withOpacity(0.7),
      pillColor: Color(MyColors.primary),
      backgroundColor: Color.fromARGB(255, 231, 242, 241),
    );
  }
}





class MyColors {
  static int header01 = 0xff151a56;
  static int primary = 0xff575de3;
  static int bg = 0xfff5f3fe;
  static int bg03 = 0xffe8eafe;
  static int grey02 = 0xff9796af;
  static int dark = 0xFF333A47;
}
