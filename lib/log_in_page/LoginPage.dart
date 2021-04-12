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
                  Center(child: Image.asset('assets/create.jpg')),
                  SizedBox(height: 20.0,),
                ],
              ),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              color: Colors.white,
              onPressed: () {
                _signInWithGoogle();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/google-logo.png'),
                  Text('Sign in with Google'),
                  Opacity(opacity: 0.0, child: Image.asset('assets/google-logo.png')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}