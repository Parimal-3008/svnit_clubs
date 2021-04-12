import 'package:flutter/material.dart';
import 'CreateAcc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'ClubList.dart';
import 'package:firebase_auth/firebase_auth.dart';
final _auth=FirebaseAuth.instance;
class Loginpage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}
 class _LoginPageState extends State<Loginpage>
 {
   String email;
   String password;
    void _showToast()
   {
     Fluttertoast.showToast(msg: 'Enter valid email or password',
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
              Text('SIGN IN',style: TextStyle(fontSize: 30.0,color: Colors.blue),
              ),
              SizedBox(width:350,height:10),
              Container(
                width: 350,
                height: 50,
                child: TextFormField( decoration:InputDecoration (
                    hintText: 'Enter your email',
         ),
         keyboardType: TextInputType.emailAddress,
         onChanged: (value) {
               setState(() {
          email = value;
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
          password = value;
        });
              },
                  ),
              ),
              SizedBox(width:350,height:10),
              ElevatedButton(onPressed: ()async{
                try
               { 
                   final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
                   if(user!=null)
                Navigator.push(context,MaterialPageRoute(builder: (context) =>ClubList() ),   );
                 } 
                 catch(e)
                 {
                        _showToast();
                 } 
                        
              }, child: Text('LOG IN',style: TextStyle(fontSize: 20)
              ,)
              ,)
              , SizedBox(width:350,height:10),
              TextButton(onPressed: (){
                Navigator.push(
    context,
   MaterialPageRoute(builder: (context) => CreateAcc()),
 );
              },
               child: Text('Create account',style: TextStyle(fontSize: 20)
               ,)
              ,)
            ],
            
            ),
          ),
        ),
      );
  }
 }
