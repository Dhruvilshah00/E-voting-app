import 'package:flutter/material.dart';
import 'package:voting_app_final/main_page/voting/Voting_Panel.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class VotingPage extends StatelessWidget {
  String Vkey;
  String CreatorName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset : false,
      backgroundColor: Colors.grey[200],
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
            child: TextFormField(
              onChanged: (val){this.CreatorName=val;},
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey,width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue,width: 1.5),
                ),
                hintText: "Enter Creator name",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Field is Required';
              //   }
              //   return null;
              // },
              validator: Validators.required('Occupation is required'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(30.0),
            padding: EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (val){this.Vkey=val;},
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey,width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue,width: 1.5),
                ),
                hintText: "Enter the Voting ID",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
              maxLength: 6,
              // ignore: deprecated_member_use
              maxLengthEnforced: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Field is Required';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 25.0,),
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
                    MaterialPageRoute(builder: (context) => VotingPanel(Vkey: this.Vkey,CreatorName: this.CreatorName,))
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
