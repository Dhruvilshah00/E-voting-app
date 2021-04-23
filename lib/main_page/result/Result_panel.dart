import 'package:flutter/material.dart';
import 'package:voting_app_final/main_page/result/results.dart';

class ResultPanel extends StatelessWidget {
  ResultPanel({this.Vkey}){
    print('result panel : ${Vkey}');
  }
  String Vkey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Results(Vkey: this.Vkey,),
    );
  }
}
