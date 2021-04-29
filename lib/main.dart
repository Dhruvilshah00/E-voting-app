import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_final/Landing_Page.dart';
import 'package:voting_app_final/main_page/create_voting/Candidate_List.dart';
import 'package:voting_app_final/main_page/create_voting/EnterCandidate.dart';
import 'package:voting_app_final/main_page/create_voting/Voting_info.dart';
import 'package:voting_app_final/main_page/mainpage.dart';
import 'package:voting_app_final/main_page/profile/Provider_Profile.dart';
import 'package:voting_app_final/main_page/profile/Update_Profile.dart';
// import 'package:voting_app_final/main_page/profile/profile_page.dart';
import 'package:voting_app_final/main_page/result/result_page.dart';
import 'package:voting_app_final/main_page/result/results.dart';
import 'package:voting_app_final/main_page/voting/Voting_Page.dart';
import 'package:voting_app_final/main_page/voting/Voting_Panel.dart';
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
        color: Colors.grey,
        debugShowCheckedModeBanner: false,
        home: LoginPage(auth: Auth(),),
        initialRoute: '/Landing',//'/mainp',
        routes: {
          '/candidate':(context)=>EnterCandidate(),
          '/cv':(context)=> CreateVoting(),
          '/Landing':(context) => LandingPage(auth: Auth(),),
          '/home':(context) => LoginPage(auth: Auth(),),
          '/updateprofile':(context)=>UpdateProfile(),
          '/takeprofile':(context) => takeprofile(),
          '/mainp':(context) => MainPage(auth: Auth(),),
          '/getid':(context) => ResultPage(),
          '/result':(context) => Results(),
          '/profilep':(context) => ProviderProfile(),
          '/vi':(context) => VotingDetails(),
          '/cl':(context) => Candidate_List(),
          '/vp':(context) => VotingPage(),
          '/vpanel':(context) => VotingPanel(),
        },
      ),
      value: Auth().onAuthStateChanged,
    );
  }
}