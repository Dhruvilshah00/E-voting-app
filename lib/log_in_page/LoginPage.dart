import 'package:flutter/material.dart';
import 'package:voting_app_final/services/auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({@required this.auth});
  final AuthBase auth;

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.redAccent,
                Colors.cyan[500],
                Colors.yellowAccent,
              ]),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 70),
            Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 55),),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: Text("Welcome to E-Voting", style: TextStyle(color: Colors.white, fontSize: 25),),
                  ),
                  SizedBox(height: 50,),
                  Opacity(
                      opacity: 0.9,
                      child: Center(child: Image.asset('assets/logo.png'))),
                  // SizedBox(height: 10.0,),
                ],
              ),
            ),
            // ignore: deprecated_member_use
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: RaisedButton(
                color: Colors.white,
                onPressed: () {
                  _signInWithGoogle();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 0, top: 10, bottom: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/google-logo.png'),
                      SizedBox(width: 5,),
                      Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      SizedBox(width: 10,),
                    ],
                  ),
                ),
              ),
            ),
            // SizedBox(height: 90.0,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline,
                      color: Colors.black87,),
                    SizedBox(width: 5,),
                    Text('Created by 19IT129 and 19IT145',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}