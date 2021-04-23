import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_final/services/auth.dart';

class Results extends StatefulWidget {
  String Vkey;
  Results({this.Vkey}){
    print('result : ${Vkey}');
  }

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    return StreamBuilder(

        stream: FirebaseFirestore.instance
            .collection('Candidate_collection/${widget.Vkey}/${user.name}')
        // .doc(user.name)
        // .collection('50')
            .snapshots(),
        builder: (context, snapshot) {
          return
            snapshot.hasData
                ? ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot userData = snapshot.data.docs[index];
                return userData.exists ? Card(
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text(
                      userData.data()['CandidateName']??'',
                    ),
                    subtitle: Text(
                      userData.data()['slogan']??'',
                    ),
                    trailing: Container(
                        child: Text('No. of Vote: ${userData.data()['vote']}')
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
