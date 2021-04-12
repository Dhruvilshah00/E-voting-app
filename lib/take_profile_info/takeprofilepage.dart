import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class takeprofile extends StatefulWidget {
  @override
  _takeprofileState createState() => _takeprofileState();
}

class _takeprofileState extends State<takeprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
         leading: Container(
          child: Icon(
            Icons.account_box,
          ),
        ),
        title: Text('Profile information'),
      ),
      body: MyCustomForm(),
    );
  }
}




class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  autofocus:true,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'First Name is Required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Last Name is Required';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  // autofocus:true,
                  decoration: InputDecoration(
                    labelText: 'Occupation',
                  ),
                  validator: Validators.required('Occupation is required'),
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                  validator: Validators.email('Enter valid E-mail Address'),

                ),
              ),
              SizedBox(height: 180.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // ignore: deprecated_member_use
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: Text('Previous'),
                    ),
                  ),

                  Container(
                    // ignore: deprecated_member_use
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Processing Data')
                            ),
                          );
                          Navigator.pushReplacementNamed(context, '/mainp');
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }
}
