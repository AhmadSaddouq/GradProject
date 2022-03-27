import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:sara_music/authi/ForgetPassword.dart';
import 'package:sara_music/authi/ResetPassword.dart';
import 'package:sara_music/authi/Signup.dart';
import 'dart:convert';
import 'package:sara_music/authi/login.dart';
import 'package:sara_music/globalss.dart';


    int counter = 0;

class Verify extends StatefulWidget{
  @override
  
  State<StatefulWidget> createState() {
    return VerifyState();
  }

}


class VerifyState extends State<Verify>{
  TextEditingController Pin = TextEditingController();
        int _counter = 0;


  @override

  Widget build(BuildContext context) {

     
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Pin Entry Example"),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
             
                  TextFormField(
                    
                     controller: Pin,
                      
                                        
                    // onSubmit: (String Pin1){
                        
                    //     Pin1 = Pin.text;
  
                   

                    //   // showDialog(
                    //   //     context: context,
                    //   //     builder: (context){
                    //   //       // return AlertDialog(
                    //   //       //   title: Text("Pin"),
                    //   //       //   content: Text(Pin.toString()),
                    //   //       // );
                    //   //     }
                    //   // ); //end showDialog()

                    // }, // end onSubmit
                  ),
                ],
              ), // end PinEntryTextField()
            ), // end Padding()
          ),
           SafeArea(
               child: Center(child: 
                  GestureDetector(
                     onTap: () { _increaseCounter();
                       login(_counter);
                      }, 
                     child: Text('Confirm'),
                 ),
              ),
           ),
          // ElevatedButton(
            
          //   onPressed: (){
          //     for(I; I< 4;I++){
                 
          //     login(I);
          //     print(I);
          //     return ;
              
          //     }
          //   },  
          //   child: Text("Confirm")
            
          //   ),
        ],
      ),
       // end Container()
    );
    
  }
 void initState() {
    super.initState();
    setState(() => _counter = counter
    );

  }
  void _increaseCounter() {
     counter++;
     setState(() => _counter++);
  }
  void _displayErrorMotionToast() {
    MotionToast.success(
      title: Text(
        'Success',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text('Welcome :)'),
      animationType: ANIMATION.fromLeft,
      position: MOTION_TOAST_POSITION.top,
      width: 300,
    ).show(context);
  }

     void _displayErrorMotionToast5() {
    MotionToast.error(
      title: Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text('Enter your email again for a new Pin Code !'),
      animationType: ANIMATION.fromLeft,
      position: MOTION_TOAST_POSITION.top,
      width: 300,
    ).show(context);
  }
    void _displayErrorMotionToast1() {
    MotionToast.error(
      title: Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text('Please Check Your Pin!'),
      animationType: ANIMATION.fromLeft,
      position: MOTION_TOAST_POSITION.top,
      width: 300,
    ).show(context);
  }
     void _displayErrorMotionToast2() {
    MotionToast.error(
      title: Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text('Please Re-SignUp using valid email!'),
      animationType: ANIMATION.fromLeft,
      position: MOTION_TOAST_POSITION.top,
      width: 300,
    ).show(context);
  }

    void _displayErrorMotionToast4() {
    MotionToast.success(
      title: Text(
        'Success',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text('You can Set a new Password :)'),
      animationType: ANIMATION.fromLeft,
      position: MOTION_TOAST_POSITION.top,
      width: 300,
    ).show(context);
  }
    Future<void> login(int I) async{
   

      var body1 = jsonEncode({
  'Pin': Pin.text,
  'token': globalss.authToken

     });
        var body2 = jsonEncode({
  'Pin': Pin.text,
  'email': globalss.ISemail

     });



       if(globalss.SignPage==1){       
    var res= await http.post(Uri.parse("http://192.168.1.41:3000/users/pin"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ' + globalss.authToken 
  },body: body1);

  if(I==4){
     _counter= 0;
            counter = 0;

     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signup()),
            );
           
            return _displayErrorMotionToast2();
  }
   print(res.statusCode);
if(res.statusCode==201){
  globalss.SignPage = 0;
   _counter= 0;
            counter = 0;
             
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
           
            return _displayErrorMotionToast();
}
else{
            return _displayErrorMotionToast1();
}
       }

       if(globalss.VerifyPage==2){
              var res1= await http.post(Uri.parse("http://192.168.1.41:3000/users/pinF"),headers: {
      'Content-Type': 'application/json; charset=UTF-8',
  },body: body2);
    
    if(I==4){
     _counter= 0;
            counter = 0;

     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgetPassword()),
            );
           
            return _displayErrorMotionToast5();
  }
     print(res1.statusCode);
if(res1.statusCode==201){
         Map<String, dynamic> DB = jsonDecode(res1.body);
             
             globalss.authToken = DB['token'];
  globalss.VerifyPage = 0;
   _counter= 0;
            counter = 0;
             
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResetPassword()),
            );
           
            return _displayErrorMotionToast4();
}


if(res1.statusCode==405){
   _counter= 0;
            counter = 0;
             
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgetPassword()),
            );
             return _displayErrorMotionToast5();


}
else{
            return _displayErrorMotionToast1();

}

       }
  }

}