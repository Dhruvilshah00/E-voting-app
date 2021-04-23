import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_final/main_page/create_voting/Create_Voting.dart';
import 'package:voting_app_final/services/auth.dart';
import 'package:voting_app_final/services/database.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class VotingDetails extends StatelessWidget {

  String V_name;
  String post;
  String host;
  String VotingKey;
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);

    return Scaffold(

      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text('Voting Details'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  onChanged: (value){this.V_name=value;},
                  // autofocus:true,
                  decoration: InputDecoration(
                    labelText: 'Voting Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Voting Name is Required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  onChanged: (value){this.post=value;},
                  decoration: InputDecoration(
                    labelText: 'Voting for (Name of the Post)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field is Required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  onChanged: (value){this.host=value;},
                  // autofocus:true,
                  decoration: InputDecoration(
                    labelText: 'Hosted by',
                  ),
                  validator: Validators.required('Host Name is required'),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  onChanged: (value){this.VotingKey=value;},
                  // autofocus:true,
                  decoration: InputDecoration(
                    labelText: 'Voting Key',
                  ),
                  validator: Validators.required('Voting Key is required'),
                ),
              ),
              SizedBox(height: 100.0,),
              // Container(
              //   child: RaisedButton(
              //      child: Text('Add Candidate'),
              //        onPressed: (){
              //         Navigator.pushNamed(context, '/candidate');
              //        },
              //   ),
              // ),
              Container(
                // ignore: deprecated_member_use
                child: ElevatedButton(
                  onPressed: () async{
                    if (_formKey.currentState.validate()) {
                      print(' V_name : ${this.V_name} post :${this.post} host : ${this.host} VotingKey : ${this.VotingKey}');
                      await DatabaseService(uid: user.uid,Vkey:this.VotingKey);
                      DatabaseService(Vkey: this.VotingKey).AddVotingDetails(V_name, post, host, VotingKey);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Processing Data')
                        ),
                      );
                      // Navigator.pushNamed(context, '/cv');
                      Navigator.push(context,
                           MaterialPageRoute(builder: (context) => CreateVoting(Vkey: this.VotingKey,))
                           );
                    }
                  },
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
