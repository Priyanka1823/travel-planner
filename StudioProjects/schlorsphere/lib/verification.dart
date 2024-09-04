import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {

  Timer? _timer;
  int _countDown = 30;
  bool canResend = false;
  bool isCodeResent = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }


  void startTimer(){
   _timer= Timer.periodic(Duration(seconds: 1), (timer) {

     setState(() {

     if(_countDown>0){
       _countDown --;
     }else{
       canResend=true;
       _timer?.cancel();

     }
     });
   });
  }
  void _resendOtp(){
    if(canResend){
      setState(() {
        _countDown=30;
        canResend = false;
        isCodeResent = true;
      });
      Future.delayed(Duration(seconds: 5), () {
        setState(() {
          isCodeResent = false;
        });
      });
      startTimer();

    }
  }
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(114, 178, 238, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      shape: BoxShape.circle,
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        margin: EdgeInsets.only(left: 25,right: 25),
        child: SingleChildScrollView(
          child:
          Column(
            children: [
              Row(
                children: <Widget>[
                  IconButton( icon: const Icon( Icons.arrow_back_sharp,semanticLabel: 'back'
                    ,),
                    onPressed: (){
                    Navigator.pop(context);
                      print('Back Button');
                    }, ),

                ],
              ),

              SizedBox(height: 10,), // Add some spacing
              Text("Verification Code", style: TextStyle(color: Colors.white,fontSize: 20,)),
              
              SizedBox(height: 10,),
              Text("Enter the code send by SMS to verify your phone number" , style: TextStyle(color: Colors.white,fontSize: 10,)),

              SizedBox(height: 20,),

              Pinput(
                 length: 4,
                 defaultPinTheme: defaultPinTheme,
                 focusedPinTheme: focusedPinTheme,
                 submittedPinTheme: submittedPinTheme,

              showCursor: true,
               onCompleted: (pin) => print(pin),
               ),
              SizedBox(height: 10,),


              SizedBox(
                height: 45 ,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){

                }, child: Text('Verify' ,style: TextStyle(color: Colors.blue ,fontWeight:FontWeight.bold), ),style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(10),
                    )
                ),),
              ),
              SizedBox(height: 10,),

              Row(
                children: [
                  Text ('00: ${_countDown.toString()}', style: TextStyle(color: Colors.white)),

                  SizedBox(width: 100,),

                  canResend?InkWell(
                    onTap: (){
                      _resendOtp();
                    },
                    child: Text(
                      isCodeResent ? "Code Resent" : "Resend Code",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),
                    ),
                  ):
                  Text("Resend Code" ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.white),)
                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}
