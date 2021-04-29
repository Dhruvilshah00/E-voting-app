import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import 'package:flutter/material.dart';

class UserProfile {
  final String uid;
  final String name;
  final String email;
  final String occupation;
  final String photoURL;

  UserProfile(
      {this.uid, this.name, this.email, this.occupation, this.photoURL});
}

class Candi {
  final String name;
  final String slogan;

  Candi({this.name, this.slogan});

}

class DatabaseService {
  DatabaseService({this.uid, this.Vkey }){
   print('constructor vkey : $Vkey');
  }

  //collection reference
  String uid;
  String CreatorName;
  final String Vkey;



  // String getRandomString(int len) {
  //   var r = Random();
  //   const _chars =
  //       'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  //   return (List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
  //           .join())
  //       .toString();
  // }


  final CollectionReference profileCollection =
      FirebaseFirestore.instance.collection('profile');

  //Create user for profile page
  Future updateUserData(
      String name, String occupation, String email, String photo) async {
    return await profileCollection.doc(uid).set({
      "name": name,
      "occupation": occupation,
      "email": email,
      "photoURL": photo,
    });
  }



  UserProfile _userProfileFromSnapshot(DocumentSnapshot snapshot) {
    //created for userData
    return UserProfile(
      uid: uid,
      name: snapshot.data()['name'],
      occupation: snapshot.data()['occupation'],
      email: snapshot.data()['email'],
      photoURL: snapshot.data()['photoURL'],
    );
  }

  Stream<UserProfile> get userData {
    //user in profile page
    return profileCollection.doc(uid).snapshots().map(_userProfileFromSnapshot);
  }

  //For Candidate

  // int rand =Random().nextInt(999999);



  //Create candidate for Enter Candidate
  CollectionReference candidate =  FirebaseFirestore.instance.collection("Candidate_collection");
  String documentIdFromCurrentDate() => DateTime.now().toIso8601String();


  Future AddVotingDetails(  String V_name, String post, String host, String VotingKey  ){
    return candidate.doc('$VotingKey').set({
      'votingname':V_name,
      'post':post,
      'host':host,
      'votingkey':VotingKey,
      'IsStart':0,
      'usersvote':[],
    });
  }
  Future UpdateVotedUsers({String userid, String VotingKey}){
    return candidate.doc(VotingKey).update({
      'usersvote': FieldValue.arrayUnion([userid]),
    });
  }

  Future VotingOn(){
    return candidate.doc('$Vkey').update({
      'IsStart':1,
    });
  }
  Future VotingOff(){
    return candidate.doc('$Vkey').update({
      'IsStart':0,
    });
  }

  Future AddCandidate(
      {String Candidatename, String Slogan, String creatorName}) {
    this.CreatorName = creatorName;
    print('Candidate Added by:${this.CreatorName}  UniqueKey: ${Vkey} uid: ${uid}');
    return candidate
        .doc(Vkey) //name : creator of voting
        .collection('$creatorName')
        .doc('$Candidatename')
        .set({
          'CandidateName': Candidatename, // null
          'slogan': Slogan, // null
          'vote':0,
        })
        .then((value) => print("Candidate Added"))
        .catchError((error) => print("Failed to add Candidate: $error"));
  }
  Future UpdateVote({int vote, String Vkey, String name, String cand}){
    return candidate.doc('$Vkey').collection(name).doc(cand).update({
      'vote':vote+1,
    });
  }


  List<Candi> _CandidateListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Candi(
        name: doc.data()['CandidateName'] ?? '',
        slogan: doc.data()['slogan']??'',
      );
    }).toList();
  }

  Stream<List<Candi>> get Candidate {
    return candidate
        .doc('$Vkey')//change to creator name
        .collection('$CreatorName')
        // .orderBy('CandidateName',descending: true)
        .snapshots().map(_CandidateListFromSnapshot);
  }
  CollectionReference voter =  FirebaseFirestore.instance.collection("voter_collection");
  Future VoterCollection(String uid){
    return voter.doc(Vkey).collection(Vkey).doc(uid).set({
      'hasVote':0,
    });
  }
  Future UpdateVoter(String uid){
    return voter.doc(Vkey).collection(Vkey).doc(uid).update({
      'hasVote':1
    });
  }


}
