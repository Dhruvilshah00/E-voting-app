import 'package:flutter/material.dart';
import 'package:voting_app_final/log_in_page/LoginPage.dart';
import 'package:voting_app_final/main_page/mainpage.dart';
import 'package:voting_app_final/services/auth.dart';

class LandingPage extends  StatelessWidget {
  LandingPage({ @required this.auth });
  final AuthBase auth;

    @override
    Widget build(BuildContext context) {
      return StreamBuilder<UserData>(
          stream: auth.onAuthStateChanged,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              UserData user = snapshot.data;
              if (user == null) {
                return LoginPage(auth: auth,);
              }
              return MainPage(
                auth: auth,
              );

            } else {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }
      );
    }

}
