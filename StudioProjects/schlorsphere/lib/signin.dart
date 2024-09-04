import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController countrycode = TextEditingController();
  // var phone ='';
  @override
  void initState() {
    // TODO: implement initState
    countrycode.text = "+91";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    print('Back Button');
      }, ),
                  SizedBox(width: 20,),
                  Center(child: Text("Sign up/ Sign in",style:TextStyle(color: Colors.black,fontSize: 25,))),

                ],
              ),

              SizedBox(height: 10,), // Add some spacing
              Text("Phone Number", style: TextStyle(color: Colors.black,fontSize: 18,)),

              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  border :Border.all(width: 1,color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countrycode,
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                      ),
                    ),

                    Text("|",style: TextStyle(fontSize: 33,color: Colors.grey,),),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(

                        child: TextField(
                          // keyboardType: TextInputType.phone,
                          // onChanged: (value){
                          //   phone = value ;
                          // },
                          decoration: InputDecoration(
                            border: InputBorder.none ,hintText: "Phone No."
                        ),))
                  ],
                ) ,
              ),
              SizedBox(height: 10,),

              SizedBox(
                height: 45 ,
                width: double.infinity,
                child: ElevatedButton(onPressed: ()
                {

                  // await FirebaseAuth.instance.verifyPhoneNumber(
                  //   phoneNumber: '+44 7123 123 456',
                  //   verificationCompleted: (PhoneAuthCredential credential) {},
                  //   verificationFailed: (FirebaseAuthException e) {},
                  //   codeSent: (String verificationId, int? resendToken) {},
                  //   codeAutoRetrievalTimeout: (String verificationId) {},
                  // );
                  Navigator.pushNamed(context, "otp");
                }, child: Text('Sign Up'),style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),),
              )



            ],
          ),


        ),
      ),
    );
  }
}
