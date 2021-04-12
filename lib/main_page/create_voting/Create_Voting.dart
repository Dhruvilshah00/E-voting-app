import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_final/main_page/create_voting/Candidate_List.dart';
import 'package:voting_app_final/services/database.dart';

class CreateVoting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().Candidate,
      child: Scaffold(
        appBar: AppBar(
          title: Text('E-voting'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.pushNamed(context, '/candidate');
          },
        ),
        body: Candidate_List(),
      ),
    );
  }
}
