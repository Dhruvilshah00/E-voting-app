import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_final/services/auth.dart';
import 'package:voting_app_final/services/database.dart';

class VoteCandidate extends StatelessWidget {
  final String Vkey;

  VoteCandidate({this.Vkey});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    return StreamBuilder<QuerySnapshot>(

        stream: FirebaseFirestore.instance
            .collection('Candidate_collection/${this.Vkey}/${user.name}')
        // .doc(user.name)
        // .collection('50')
            .snapshots(),
        builder: (context, snapshot) {
          // final record = Record.fromSnapshot(snapshot);
          return
            snapshot.hasData
                ? ListView.builder(

              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot userData = snapshot.data.docs[index];
                return userData.exists ? Card(
                  child: ListTile(
                    onTap: (){

                    },
                    leading: FlutterLogo(),
                    title: Text(
                      userData.data()['CandidateName']??'',
                    ),
                    subtitle: Text(
                      userData.data()['slogan']??'0',
                    ),
                    trailing: FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: (){
                        DatabaseService(Vkey: this.Vkey).UpdateVote(vote: userData.data()['vote'],Vkey: this.Vkey,name: user.name,cand: userData.data()['CandidateName']);
                      },
                      child: Text('Vote',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ): CircularProgressIndicator() ;
              },
            )
                :
            CircularProgressIndicator();
        }
    );
  }
}
