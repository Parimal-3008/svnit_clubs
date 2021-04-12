import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'ClubList.dart';

class CreateAcc extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => new _CreateAccState();
}
class _CreateAccState extends State<CreateAcc>
 {
   final _auth=FirebaseAuth.instance;
      String email1;
   String password1;
   void _showToast()
   {
     Fluttertoast.showToast(msg: 'Enter valid email',
      toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM, 
        backgroundColor:Colors.grey,
        textColor: Colors.black);
   }
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('MY MUSIC PLAYER')),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Create Account',style: TextStyle(fontSize: 30.0,color: Colors.blue),
              ),
              SizedBox(width:350,height:10),
              Container(
                width: 350,
                height: 50,
                child: TextFormField( decoration:InputDecoration (
                    hintText: 'Enter  email',
         ),
         keyboardType: TextInputType.emailAddress,
         onChanged: (value) {
               setState(() {
          email1 = value;
        });
              },
                  ),
              ),         
              SizedBox(width:350,height:10),
               Container(
              width: 350,
                height: 50,
                child: TextFormField( decoration:InputDecoration (
                    hintText: 'Password',
               ),
          obscureText:true,
        onChanged: (value) {
               setState(() {
          password1= value;
        });
              },
                  ),
              ),
              SizedBox(width:350,height:10),
              ElevatedButton(onPressed: ()async{
                try{
               final newuser= await  _auth.createUserWithEmailAndPassword(email: email1, password: password1);
               Navigator.push(    context,   MaterialPageRoute(builder: (context) => ClubList()),
 );
              }
              catch(e)
              {
                _showToast();
              }
              }
              , child: Text('Create ',style: TextStyle(fontSize: 20)
              ,)
              ,)
              , SizedBox(width:350,height:10),
              
            ],
            
            ),
          ),
        ),
      );
  }
 }