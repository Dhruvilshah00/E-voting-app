import 'package:flutter/material.dart';
import 'package:voting_app_final/services/auth.dart';

class MainPage extends StatefulWidget {
  MainPage({@required this.auth});
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('E-voting'),
        // leading: Icon(
        //   Icons.android,
        // ),
        automaticallyImplyLeading: false,
        actions: [
          // ignore: deprecated_member_use
          FlatButton(
              child: Text(
                  'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                ),
              ),
            onPressed: () {
              widget._signOut();
            },
          )
        ],
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Image.asset('assets/create.jpg'),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.pushNamed(context, '/cv');
                    },
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Text(
                      'Create Voting',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Image.asset('assets/vote.jpg'),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.pushNamed(context, '/getid');
                    },
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Text(
                      'Voting',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 30.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: Image.asset('assets/result.png'),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.pushNamed(context, '/getid');
                    },
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Text(
                      'Results',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: Image.asset('assets/profile.png'),
                    iconSize: 150,
                    onPressed: () {
                      Navigator.pushNamed(context, '/profilep');
                    },
                  ),
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
