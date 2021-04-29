import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_app_final/services/auth.dart';
import 'package:voting_app_final/services/database.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String currentName;
  String currentOccupation;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('UpdateProfile'),
      ),
      body: StreamBuilder<UserProfile>(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserProfile userData= snapshot.data;
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: userData.name??'name',
                          onChanged: (value)=>currentName=value,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue,width: 1.5),
                            ),
                            labelText: 'Name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          initialValue: userData.occupation??'Your Occupation',
                          onChanged: (value)=>currentOccupation=value,
                          // autofocus:true,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue,width: 1.5),
                            ),
                            labelText: 'Occupation',
                          ),
                          validator:
                              Validators.required('Occupation is required'),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // ignore: deprecated_member_use
                            child: ElevatedButton(
                              onPressed: () async{
                                print('name : $currentName   Occupation: $currentOccupation   photo: ${userData.photoURL}');
                                if (_formKey.currentState.validate()) {
                                  await DatabaseService(uid: user.uid).updateUserData(
                                    currentName?? userData.name,
                                    currentOccupation?? userData.occupation,
                                    userData.email,
                                    userData.photoURL,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')),
                                  );
                                  Navigator.pop(context);
                                }
                              },
                              child: Text('Done'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            } else
              return CircularProgressIndicator();
          }),
    );
  }
}
