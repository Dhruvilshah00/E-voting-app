import 'package:flutter/material.dart';
import 'package:voting_app_final/main_page/result/results.dart';

class ResultPanel extends StatelessWidget {
  String Vkey;
  String CreatorName;
  ResultPanel({this.Vkey,this.CreatorName}){
    print('result panel : ${Vkey}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Results(Vkey: this.Vkey,CreatorName: this.CreatorName,),
    );
  }
}
