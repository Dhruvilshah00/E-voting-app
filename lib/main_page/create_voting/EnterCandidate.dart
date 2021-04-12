import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_final/services/auth.dart';
import 'package:voting_app_final/services/database.dart';
import 'dart:math';
import 'package:wc_form_validators/wc_form_validators.dart';


class EnterCandidate extends  StatefulWidget {


  EnterCandidate({this.Candidatename,this.Slogan});
  String Candidatename;
  String Slogan;


  @override
  _EnterCandidateState createState() => _EnterCandidateState();
}

class _EnterCandidateState extends State<EnterCandidate> {



  DatabaseService databaseService;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    var creatorName=user.name;


    //Add candidate to Creating Voting
    // CollectionReference candidate = Firestore.instance.collection('Candidate_collection');
    //
    //
    // Future<void> AddCandidate() {
    //   // Call the user's CollectionReference to add a new user
    //
    //   print('Candidate Added by:${widget.CreaterName}');
    //   return candidate.document(databaseService.username)//name : creator of voting
    //       .collection('${widget.Candidatename}')
    //       .document('${widget.Candidatename}')
    //       .setData({
    //     'CandidateName': this.widget.Candidatename, // null
    //     'slogan': this.widget.Slogan, // null
    //   })
    //       .then((value) => print("Candidate Added"))
    //       .catchError((error) => print("Failed to add Candidate: $error"));
    // }
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  autofocus:true,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  onChanged: (value){
                    widget.Candidatename=value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is Required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Slogan',
                  ),
                  onChanged: (value){
                    widget.Slogan=value;
                  },
                ),
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // ignore: deprecated_member_use
                    child: ElevatedButton(
                      onPressed: () {
                        DatabaseService().AddCandidate(Candidatename: widget.Candidatename,Slogan: widget.Slogan,creatorName: creatorName);
                        if (_formKey.currentState.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Processing Data')
                            ),
                          );
                          Navigator.pushReplacementNamed(context, '/cv');
                        }
                      },
                      child: Text('Add'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
