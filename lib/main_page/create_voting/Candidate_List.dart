import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_final/services/auth.dart';
import 'package:voting_app_final/services/database.dart';

// ignore: camel_case_types
class Candidate_List extends StatelessWidget {

  final String Vkey;

  Candidate_List({this.Vkey});
  // int UniqueKey;
  @override
  Widget build(BuildContext context) {
    // print('Candidate_List Unique Key : ${DatabaseService().UniqueKey}');

    final user = Provider.of<UserData>(context);
    final candidates = Provider.of<List<Candi>>(context);
    // print('this is : ${candidates}');
    //
    // candidates.forEach((ele) {
    //   print('slogan: ${ele.slogan}');
    //   print('name: ${ele.name}');
    // });
    // for (var doc in candidates.docs){
    //   print('hello ${doc}');
    // }
    return StreamBuilder(

        stream: FirebaseFirestore.instance
            .collection('Candidate_collection/${this.Vkey}/${user.name}')
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
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async{
                            await FirebaseFirestore.instance.runTransaction((Transaction myTransaction) async {
                              await myTransaction.delete(snapshot.data.docs[index].reference);
                            });
                          },
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
