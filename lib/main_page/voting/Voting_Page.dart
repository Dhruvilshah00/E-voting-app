import 'package:flutter/material.dart';
import 'package:voting_app_final/main_page/voting/Voting_Panel.dart';

class VotingPage extends StatelessWidget {
  String Vkey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('Get ID'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30.0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[400])
                )
            ),
            child: TextField(
              onChanged: (val){this.Vkey=val;},
              decoration: InputDecoration(
                hintText: "Enter the Voting ID",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              maxLength: 6,
              // ignore: deprecated_member_use
              maxLengthEnforced: true,
            ),
          ),
          SizedBox(height: 30.0,),
          Container(
            // ignore: deprecated_member_use
            child: RaisedButton(
              padding: EdgeInsets.only(left: 35.0, right: 35.0, top: 15.0, bottom: 15.0),
              color: Colors.cyan,
              child: Text(
                'SUBMIT',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
              onPressed: () {
                // Navigator.pushNamed(context, '/vpanel');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VotingPanel(Vkey: this.Vkey,))
                );
              },
            ),
          ),
          SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}
