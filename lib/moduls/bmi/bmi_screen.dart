// import 'dart:math';
//
// import 'package:first_project/moduls/bmi_result/bmi_result.dart';
// import 'package:flutter/material.dart';
//
// class BmiScreen extends StatefulWidget {
//   @override
//   _BmiScreenState createState() => _BmiScreenState();
// }
//
// class _BmiScreenState extends State<BmiScreen> {
//   bool isMale = true;
//   double height = 120.0;
//   int weight = 55;
//   int age = 20;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BMI'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isMale = true;
//                       });
//                     },
//                     child: Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image(
//                             image: AssetImage(
//                               'assets/male.png',
//                             ),
//                             width: 90,
//                             height: 90,
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             'Male',
//                             style: TextStyle(
//                                 fontSize: 25, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: isMale ? Colors.blue : Colors.grey[400]),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isMale = false;
//                       });
//                     },
//                     child: Container(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Image(
//                             image: AssetImage(
//                               'assets/female.png',
//                             ),
//                             width: 90,
//                             height: 90,
//                           ),
//                           SizedBox(
//                             height: 15,
//                           ),
//                           Text(
//                             'Female',
//                             style: TextStyle(
//                                 fontSize: 25, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: !isMale ? Colors.blue : Colors.grey[400]),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )),
//           Expanded(
//               child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.grey[400]),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Height',
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline.alphabetic,
//                     children: [
//                       Text(
//                         '${height.round()}',
//                         style: const TextStyle(
//                             fontSize: 50, fontWeight: FontWeight.w900),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       const Text(
//                         'CM',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   Slider(
//                       max: 220,
//                       min: 80,
//                       value: height,
//                       onChanged: (value) {
//                         setState(() {
//                           height = value;
//                         });
//                         print(value.round());
//                       })
//                 ],
//               ),
//             ),
//           )),
//           Expanded(
//               child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.grey[400]),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Weight',
//                           style: TextStyle(
//                               fontSize: 25, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           '$weight',
//                           style: TextStyle(
//                               fontSize: 50, fontWeight: FontWeight.w900),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             FloatingActionButton(
//                               onPressed: () {
//                                 setState(() {
//                                   weight--;
//                                 });
//                               },
//                               heroTag: 'weight-',
//                               mini: true,
//                               child: Icon(Icons.remove),
//                             ),
//                             FloatingActionButton(
//                               onPressed: () {
//                                 setState(() {
//                                   weight++;
//                                 });
//                               },
//                               heroTag: ' weight+',
//                               mini: true,
//                               child: Icon(Icons.add),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.grey[400]),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Age',
//                           style: TextStyle(
//                               fontSize: 25, fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           '$age',
//                           style: TextStyle(
//                               fontSize: 50, fontWeight: FontWeight.w900),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             FloatingActionButton(
//                               onPressed: () {
//                                 setState(() {
//                                   age--;
//                                 });
//                               },
//                               heroTag: 'age-',
//                               mini: true,
//                               child: Icon(Icons.remove),
//                             ),
//                             FloatingActionButton(
//                               onPressed: () {
//                                 setState(() {
//                                   age++;
//                                 });
//                               },
//                               heroTag: 'age+',
//                               mini: true,
//                               child: Icon(Icons.add),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )),
//           Container(
//             height: 40,
//             width: double.infinity,
//             color: Colors.blue,
//             child: MaterialButton(
//               onPressed: () {
//                 double result = weight / pow(height / 100, 2);
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => BmiResult(
//                               age: age,
//                               isMale: isMale,
//                               result: result.round(),
//                             )));
//               },
//               child: const Text(
//                 'CALCULATE',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
