import 'package:flutter/material.dart';
import 'package:voting_app_final/main_page/profile/profile_page.dart';
import 'package:voting_app_final/services/auth.dart';

class ProviderProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.amberAccent),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Profile',
        style: TextStyle(
          color: Colors.amberAccent,
        ),
        ),
        actions: [
          // ignore: deprecated_member_use
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 17.0,
              ),
            ),
            onPressed: () {
              // widget._signOut();
            },
          )
        ],
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[850],
      ),
      body: ProfilePage(),
      floatingActionButton: Container(
        height: 50.0,
        width: 200.0,
        child: FloatingActionButton.extended(
          onPressed: (){
            Navigator.pushNamed(context, '/updateprofile');
          },
          label: Text('Update',
            style: TextStyle(
              fontSize: 18.0
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
