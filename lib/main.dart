import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_final/Landing_Page.dart';
import 'package:voting_app_final/main_page/create_voting/EnterCandidate.dart';
import 'package:voting_app_final/main_page/mainpage.dart';
import 'package:voting_app_final/main_page/profile/Provider_Profile.dart';
// import 'package:voting_app_final/main_page/profile/profile_page.dart';
import 'package:voting_app_final/main_page/result/result_page.dart';
import 'package:voting_app_final/main_page/result/results.dart';
import 'package:voting_app_final/services/auth.dart';
import 'package:voting_app_final/take_profile_info/takeprofilepage.dart';
import 'package:flutter/material.dart';
import 'package:voting_app_final/log_in_page/LoginPage.dart';

import 'main_page/create_voting/Create_Voting.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return StreamProvider.value(
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        initialRoute: '/Landing',//'/mainp',
        routes: {
          '/candidate':(context)=>EnterCandidate(),
          '/cv':(context)=> CreateVoting(),
          '/Landing':(context) => LandingPage(auth: Auth(),),
          '/home':(context) => LoginPage(),
          '/takeprofile':(context) => takeprofile(),
          '/mainp':(context) => MainPage(),
          '/getid':(context) => ResultPage(),
          '/result':(context) => Results(),
          '/profilep':(context) => ProviderProfile(),
        },
      ),
      value: Auth().onAuthStateChanged,
    );
  }
}