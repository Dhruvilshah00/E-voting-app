import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';


class UserProfile {
  final String uid;
  final String name;
  final String email;
  final String occupation;

  UserProfile({this.uid, this.name, this.email, this.occupation});
}

class Candi {


  final String name;
  final String email;
  final String occupation;

  Candi({this.name, this.email, this.occupation});


}

class DatabaseService {
  DatabaseService({this.uid});

  //collection reference
  String uid;
  String CreatorName;

  String getRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return (List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
            .join())
        .toString();
  }

  String getUserId() {
    return uid;
  }

  final CollectionReference profileCollection =  FirebaseFirestore.instance.collection('profile');

  //Create user for profile page
  Future updateUserData(String name, String occupation, String email) async {
    return await profileCollection.doc(uid).set({
      "name": name,
      "Occupation": occupation,
      "email": email,
    });
  }

  UserProfile _userProfileFromSnapshot(DocumentSnapshot snapshot) {
    //created for userData
    return UserProfile(
      uid: uid,
      name: snapshot.data()['name'],
      occupation: snapshot.data()['occupation'],
      email: snapshot.data()['email'],
    );
  }

  Stream<UserProfile> get userData {
    //user in profile page
    return profileCollection
        .doc(uid)
        .snapshots()
        .map(_userProfileFromSnapshot);
  }

  int UniqueKey = Random().nextInt(999999);

  CollectionReference candidate = FirebaseFirestore.instance.collection('Candidate_collection');

  //Create candidate for Enter Candidate
  Future AddCandidate(
      {String Candidatename, String Slogan, String creatorName}) {
    this.CreatorName = creatorName;
    print('Candidate Added by:${this.CreatorName}');
    return candidate
        .doc(creatorName) //name : creator of voting
        .collection('$UniqueKey')
        .doc(Candidatename)
        .set({
          'CandidateName': Candidatename, // null
          'slogan': Slogan, // null
        })
        .then((value) => print("Candidate Added"))
        .catchError((error) => print("Failed to add Candidate: $error"));
  }

  List<Candi> _CandidateListFromSnapshot(QuerySnapshot snapshot){

  }

  Stream<QuerySnapshot> get Candidate {
    return candidate
        .doc('${this.CreatorName}')
        .collection('$UniqueKey')
        .snapshots();
  }
}






