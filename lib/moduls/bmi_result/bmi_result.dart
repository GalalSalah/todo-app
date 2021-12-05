import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final int result;
  final bool isMale;
  final int age;

  BmiResult({required this.age, required this.isMale, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Result'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Gender : ${isMale?'Male':'Female'} ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            'Result : $result',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text(
            'Age : $age',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ],
      )),
    );
  }
}
