import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_final/services/auth.dart';

class Results extends StatefulWidget {
  String Vkey;
  String CreatorName;
  Results({this.Vkey,this.CreatorName}){
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
            .collection('Candidate_collection/${widget.Vkey}/${widget.CreatorName}')
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
                    trailing: Padding(
                      padding: EdgeInsets.all(10),
                      // backgroundColor: Colors.cyan,
                        child: FlatButton(
                          color: Colors.blue[400],
                          onPressed: () {},
                          child: Text('No. of Vote: ${userData.data()['vote']}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
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
