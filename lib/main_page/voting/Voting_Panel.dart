import 'package:flutter/material.dart';
import 'package:voting_app_final/main_page/voting/Vote_Candidate.dart';

class VotingPanel extends StatelessWidget {
  final String Vkey;

  VotingPanel({this.Vkey});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vote'),
      ),
      body: VoteCandidate(Vkey: this.Vkey,),
    );
  }
}
