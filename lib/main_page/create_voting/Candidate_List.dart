import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voting_app_final/services/auth.dart';
import 'package:voting_app_final/services/database.dart';

// ignore: camel_case_types
class Candidate_List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    final candidates = Provider.of<QuerySnapshot>(context);
    print('this is : ${candidates.docs}');
    for (var doc in candidates.docs){
      print('hello ${doc.data}');
    }
    return StreamBuilder(

        stream: FirebaseFirestore.instance
            .collection('Candidate_collection')
            .doc(user.name)
            .collection('${DatabaseService().UniqueKey}')
            .snapshots(),
        builder: (context, orderSnapshot) {
          return orderSnapshot.hasData
              ? ListView.builder(
                  itemCount: orderSnapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot userData =
                        orderSnapshot.data.documents[index];
                    return Card(
                      child: ListTile(
                        leading: FlutterLogo(),
                        title: userData.data()['CandidateName'],
                        subtitle: userData.data()['slogan'],
                      ),
                    );
                  },
                )
              : CircularProgressIndicator();
        });
  }
}
