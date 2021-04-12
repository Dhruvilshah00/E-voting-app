import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_final/services/auth.dart';
import 'package:voting_app_final/services/database.dart';

class ProfilePage extends StatefulWidget {


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    var temp = user.uid;
    // temp = null?user.uid:user.uid;
    return StreamBuilder<UserProfile>(
        stream: DatabaseService(uid: temp!=null?user.uid:'not null').userData,//error as ujas
        builder: (context, snapshot) {
          print("user id is : ${temp}");
          if (snapshot.hasData) {
            UserProfile userProfile = snapshot.data;
            return Padding(
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                      radius: 60.0,
                    ),
                  ),
                  Divider(
                    height: 90.0,
                    color: Colors.grey[200],
                  ),
                  Text(
                    'NAME',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    userProfile.name,
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'Occupation',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    userProfile.occupation,
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.mail,
                        color: Colors.grey[400],
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        userProfile.email,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else
            return CircularProgressIndicator();
        });
  }
}
