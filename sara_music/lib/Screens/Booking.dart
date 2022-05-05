import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:sara_music/Screens/bottom_bar.dart';
import 'package:shape_of_view_null_safe/generated/i18n.dart';
import 'package:toggle_bar/toggle_bar.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import 'package:sara_music/globalss.dart';
import 'package:sara_music/Futures.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sara_music/Screens/Category.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:full_screen_menu/full_screen_menu.dart';

class Booking extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    
    return BookingState();
  }
}


class BookingState extends State<Booking> {

 late Future username;
  late Future username1;
  late Future TeachInst;
  String Ahmad = "";

  List<String> labels = ["Booking", "Appointment"];
  List teacher = [];
    List Instruments = [];
late Future n;
late Future n1;
late Future n2;
late Future n3;
  TextEditingController Time = TextEditingController();
    TextEditingController Date = TextEditingController();
    TextEditingController Tname = TextEditingController();
        TextEditingController Instrument = TextEditingController();


var teacher1 = 0;

  int currentIndex = 0;
     var NAME1="1";
   var NameIns;
   var CountTeacher="0";
   var arr;
    var NAME2="1";
   var arr2;
   var DDate = "";
   var TTime = "";
   var TNAME = "";
   

   Future SD()async{
try{
  var res= await http.get(Uri.parse(globalss.IP+"/tasks/SD"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization': 'Bearer ' + globalss.authToken 


  });
if(mounted){
  if(res.statusCode==200){
    DDate = res.body;
  }
}
}catch(e){
  print(e);
}
  return await [DDate];

   }
    Future ST()async{
try{
  var res= await http.get(Uri.parse(globalss.IP+"/tasks/ST"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
                  'Authorization': 'Bearer ' + globalss.authToken 


  });
if(mounted){
  if(res.statusCode==200){
    TTime = res.body;
  }
     
   }
   }catch(e){
     print(e);
   }
     return await [TTime];

    }
    Future STN()async{
     try{
  var res= await http.get(Uri.parse(globalss.IP+"/tasks/STN"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
   'Authorization': 'Bearer ' + globalss.authToken 


  });
  if(mounted){
    if(res.statusCode==200){
      TNAME = res.body;
    }
  }
     }catch(e){
       print(e);
     }
  return await [TNAME];

     
   }
 Future  CountT()  async {
try{
  var res= await http.get(Uri.parse(globalss.IP+"/Ttasks/count"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',

  });

    if(mounted){

  if(res.statusCode==200){
        setState(() {
         CountTeacher= res.body;

    });

    }
    
  
   
  }
}catch(e){
  print(e);
}

    return await [int.parse(CountTeacher)] ;

  
  
  }

    Future TEACHINS() async{
      try{
 var res= await http.get(Uri.parse(globalss.IP+"/Ttasks/INST"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });
      if(mounted){

  if(res.statusCode==200){
       setState(() {
         NAME2= res.body;

  });
     
    }
   
  }
 

    var NAME3 =  NAME2.toString();
    arr2 =  NAME3.split(",");
    if(CountTeacher!=""){
    for(int i = 0; i<int.parse(CountTeacher);i++){
      Instruments.add( arr2[i]);
    }
    }
      }catch(e){
        print(e);
      }
    return await [Instruments] ;


    
   
  }

   
  
  Future SETNAME1() async{
    try{
 var res= await http.get(Uri.parse(globalss.IP+"/Ttasks/TeachersList"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + globalss.authToken 

  });
      if(mounted){

  if(res.statusCode==200){
       setState(() {
         NAME1= res.body;

  });
     
    }
   
  }
 

    var NAME =  NAME1.toString();
    arr =  NAME.split(",");
    if(CountTeacher!=""){
    for(int i = 0; i<int.parse(CountTeacher);i++){
      teacher.add( arr[i]);
    }
    }
    }catch(e){
      print(e);
    }
    return await teacher ;


    
   
  }
    
 
      // final Future<void> _calculation = SETNAME1;

  bool _verticalList = false;
  var instrument = 0;
  ScrollController _scrollController = ScrollController();
  
  int value = 0;
  Widget CustomRadioButton(String text, int index1,TextEditingController Time) {
    return OutlineButton(
      onPressed: () {
        Time.text = text;
        setState(() {
             

          value = index1;
             
          TextFormField(
             controller:Time,
        

          );
        });
      },
      color: Colors.pink[600],
      hoverColor: Colors.pink,
      padding: EdgeInsets.all(15),
      child: Text(
        text,
        style: TextStyle(
          color: (value == index1) ? Colors.pink.shade600 : Colors.black,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      borderSide: BorderSide(
          width: 3,
          color: (value == index1) ? Colors.pink.shade600 : Colors.black),
    );
  }
        DateTime _selectedDate = DateTime.now();

  @override
  void initState(){
    super.initState();
   username1 = CountT();
  TeachInst = TEACHINS();
    username = SETNAME1();
    n = SD();
    n1 = ST();
    n2 = STN();
  
  }
  
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  SizedBox(width: 10,),
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
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, bottom: 5),
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
                height: 10,
              ),
              ToggleBar(
                labels: labels,
                backgroundColor: Color.fromARGB(255, 107, 129, 133),
                selectedTabColor: Colors.pink[600],
                onSelectionUpdated: (index1) 
                    {
                      
                     
                        setState(() {
                          currentIndex = index1;
                        });
                               
                                  
     
   
                                },
              ),
              SizedBox(
                height: 40,
              ),
              if (currentIndex == 0) Column(
                    
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: <Widget>[
                      
                        Padding(
                          
                          padding: const EdgeInsets.only(left: 18, bottom: 8),
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
                              color: Color.fromARGB(255, 231, 241, 241),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            
                            children: [
                              
                              SizedBox(
                                height: 5,
                              
                              ),
                            
                              
                              
                              
                            CalendarTimeline (
                                
                                
                                showYears: true,
                                initialDate: _selectedDate,
                                
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)),
                                     
                                onDateSelected:(date)
                                 {
                                   
        setState(() {
       
          
            _selectedDate=date!;
            Date.text = _selectedDate.toString();
          
          
     });
                                  
                                  
                               
                                  
     
   
                                }
                                ,
                                leftMargin: 20,
                                monthColor: Colors.black,
                                dayColor: Colors.black,
                                dayNameColor: Colors.white,
                                activeDayColor: Colors.white,
                                activeBackgroundDayColor: Colors.pink[600],
                                dotsColor: Colors.white,
                                selectableDayPredicate: (date) =>
                              
                                    date.day != 23,
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
                              color: Color.fromARGB(255, 231, 241, 241),
                              borderRadius: BorderRadius.circular(30)),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 20,
                            
                            runSpacing: 10,
                            children: [
                              CustomRadioButton("9-10 am", 1,Time),
                              CustomRadioButton("10-11 am", 2,Time),
                              CustomRadioButton("11-12 pm", 3,Time),
                              CustomRadioButton("12-1 pm", 4,Time),
                              CustomRadioButton("1-2 pm", 5,Time),
                              CustomRadioButton("2-3 pm", 6,Time),
                              CustomRadioButton("3-4 pm", 7,Time),
                              CustomRadioButton("4-5 pm", 8,Time),
                              CustomRadioButton("5-6 pm", 9,Time),
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
                            child: Waitforme()
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 15, bottom: 50),
                          child: ElevatedButton(
                            child: Text("Booking Now"),
                            onPressed: () {BOOK();},
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
                    ) else SizedBox(
                      height: 450,
                      child: ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        itemCount: 1,
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(indent: 16),
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          width: 283,
                          height: 160,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 231, 241, 241),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 30,
                                right: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 80,
                                        height: 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.pink[600],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          "${TTime}",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        width: 100,
                                        height: 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Colors.pink[600],
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text(
                                          "${DDate}",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                        SizedBox(height: 5,),
                                   
                                    Text(
                                    
                                     "${TNAME}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                   
                                    Text(
                                    
                                     categories[index].name,
                                    

                                      style: TextStyle(
                                        color: Color.fromARGB(255, 71, 65, 65),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 20,
                                top: 15,
                                child: SizedBox(
                                  width: 80,
                                  height: 110,
                                  child: Hero(
                                    tag: "${teacher[index]}",
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 40,
                                      child: CircleAvatar(
                                        radius: 35,
                                        backgroundImage:
                                            AssetImage('images/ehab.jpg'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 5,
                                  right: 15,
                                  child: InkWell(
                                    onTap: () => showFullScreenMenu(context),
                                    child: Image.asset(
                                        "images/icons-meatball.png",
                                        height: 30),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
      
    );
    
  

  }
  

  void showFullScreenMenu(BuildContext context) {
    FullScreenMenu.show(
      context,
      backgroundColor: Colors.black,
      items: [
        FSMenuItem(
          icon: Icon(Icons.edit, color: Colors.white),
          text: Text('Edit', style: TextStyle(color: Colors.white)),
          gradient: deepPurpleGradient,
        ),
        FSMenuItem(
          icon: Icon(Icons.delete, color: Colors.white),
          text: Text('Delete', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
  
     void _displayErrorMotionToast3() {
       
    MotionToast.error(
      title: Text(
        "Error",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text("You can't book to many teachers!"),
      animationType: ANIMATION.fromLeft,
      position: MOTION_TOAST_POSITION.top,
      width: 300,
    ).show(context);
  }
     void _displayErrorMotionToast10() {
       
    MotionToast.success(
      title: Text(
        "Success",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text('Booked'),
      animationType: ANIMATION.fromLeft,
      position: MOTION_TOAST_POSITION.top,
      width: 300,
    ).show(context);
  }
    void _displayErrorMotionToast5() {
       
    MotionToast.error(
      title: Text(
        "Error",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text('Ops!, looks like our class is full'),
      animationType: ANIMATION.fromLeft,
      position: MOTION_TOAST_POSITION.top,
      width: 300,
    ).show(context);
  }
    void _displayErrorMotionToast1() {
       
    MotionToast.error(
      title: Text(
        "Error",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text('You are already Booked to a date with this teacher!'),
      animationType: ANIMATION.fromLeft,
      position: MOTION_TOAST_POSITION.top,
      width: 300,
    ).show(context);
  }
  
    void _displayErrorMotionToast2() {
       
    MotionToast.error(
      title: Text(
        "Error",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text('This Date is already booked, try another one!'),
      animationType: ANIMATION.fromLeft,
      position: MOTION_TOAST_POSITION.top,
      width: 300,
    ).show(context);
  }
  Future<void> BOOK() async{
   

      var body1 = jsonEncode({
  'name': Tname.text,
  'Time' : Time.text,
  'Date' : Date.text,
  'instrument' : Instrument.text,
  'token': globalss.authToken

     });
  print(Date.text);
    var res= await http.patch(Uri.parse(globalss.IP+"/tasks/TheTeacher"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ' + globalss.authToken 
  },body: body1);
  
   if(res.statusCode==200){
        // Map<String,dynamic> DB = jsonDecode(res.body);

                   return _displayErrorMotionToast10();

   }
   else{
     if(res.body=="AlreadySigned"){
       return _displayErrorMotionToast1();

     }
      else if(res.body=="BookedDate"){
       return _displayErrorMotionToast2();

     }
       else if(res.body=="NO"){
       return _displayErrorMotionToast3();

     }
     else if(res.body=="Max"){
       return _displayErrorMotionToast5();

     }
   }
   
    }
Widget Waitforme() {
  
  return FutureBuilder(future: username1, builder:((context, snapshot)  {

      return snapshot.data==null||teacher.length<=0||Instruments.length<=0||int.parse(CountTeacher)<=0?  Center(child: CircularProgressIndicator()):
      ListView.builder(
                                controller: _scrollController,
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: _verticalList
                                    ? Axis.vertical
                                    : Axis.horizontal,
                                itemCount: int.parse(CountTeacher),
                                itemBuilder: (BuildContext context, int index) {
                                    
                                  Color? color = Colors.pink[600];
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        instrument = index;
                                        Tname.text = teacher[index];
                                        Instrument.text = Instruments[index];
                                      });
                                    },
                                    child: Container(
                                      
                                        alignment: Alignment.center,
                                        child: Column(
                                          
                                          
                                          children: [
                                                

                                              
                                            Text(
                                            "${Instruments[index]}",
                                              
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
                                                image: AssetImage(
                                                    'images/Logo.png'),
                                                foregroundDecoration:
                                                    BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          
          Text(     
                                      "${teacher[index]}",             
                                    
                                                       

                                              
                                                 
                                               textAlign: TextAlign.center,
                                               style: TextStyle(
                                                
                                                 fontSize: 13,
                                                 color: instrument == index
                                                     ? Colors.white
                                                     : Colors.black,
                                                 height: 1,
                                               )
                                               ,
                                             )
      
                                              

                                           
                                            
                                        
                                          ],
                                        ),
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                300,
                                        decoration: BoxDecoration(
                                            color: instrument == index
                                                ? color
                                                : Color.fromARGB(255, 231, 241, 241),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10, bottom: 20)),
                                  );
                                });
      

  }));
}
}
