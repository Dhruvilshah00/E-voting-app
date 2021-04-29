import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_final/main_page/voting/Vote_Candidate.dart';
import 'package:voting_app_final/services/auth.dart';

class VotingPanel extends StatelessWidget {
  final String Vkey;
  final String CreatorName;
  List users;
  VotingPanel({this.Vkey,this.CreatorName});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Candidate_collection').doc(Vkey).snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          users = List.from(snapshot.data["usersvote"]);  // snapshot.data['usersvote'];
          print('Voting Panel users : $users');
          return VoteCandidate(Vkey: this.Vkey,UsersVote: users,CreatorName: this.CreatorName,);
        },
      ),
      // body:VoteCandidate(Vkey: this.Vkey,),
    );
  }
}
