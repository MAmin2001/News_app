import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart' ;
import 'package:untitled1/modules/bmi_result/BmiResult.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 120.0;
  int weight = 40;
  int age = 16;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title:
        Text(
            'BMI CALCULATOR'
        ),
        centerTitle: true,
          backgroundColor: Colors.blue[900],
        elevation: 0.0,
      ),
      body: Column(
        children: [
           Expanded(
             child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(() {

                            isMale = true;
                          });
                        },
                        child: Expanded(
                          child: Container(
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: isMale?Colors.pinkAccent :Colors.blue[700]
                            ) ,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                      image:AssetImage('images/male.png'),
                                    height: 70.0,
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                      'MALE',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                              isMale = false;
                          });
                        },
                        child: Expanded(
                          child: Container(
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color:isMale? Colors.blue[700]:Colors.pinkAccent
                            ) ,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage('images/female.png'),
                                    height: 70.0,

                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    'FEMALE',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
           ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0),
               child: Container(
                 decoration:BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0),
                     color: Colors.blue[700]
                 ) ,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'HEIGHT',
                       style: TextStyle(
                           fontSize: 20.0,
                           color: Colors.white,
                           fontWeight: FontWeight.bold
                       ),
                     ),
                     SizedBox(
                       height: 10.0,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic,
                       children: [
                         Text(
                           '${height.round()}',
                           style: TextStyle(
                               fontSize: 30.0,
                               color: Colors.white,
                               fontWeight: FontWeight.w900
                           ),
                         ),
                         SizedBox(
                           width: 5.0,
                         ),
                         Text(
                           'CM',
                           style: TextStyle(
                               fontSize: 15.0,
                               color: Colors.white,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                       ],
                     ),
                     Slider(
                         value: height,
                         max: 220,
                         min: 80,
                         thumbColor: Colors.pinkAccent,
                         inactiveColor: Colors.pinkAccent,
                         onChanged: (value)
                     {
                       setState(() {
                         height = value;
                       });
                     }
                     )
                   ],
                 ),
               ),
             ),
           ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Row(
                 children: [
                   Expanded(
                     child: Container(
                     decoration:BoxDecoration(
                         borderRadius: BorderRadius.circular(10.0),
                         color: Colors.blue[700]
                     ) ,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           'WEIGHT',
                           style: TextStyle(
                               fontSize: 20.0,
                               color: Colors.white,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                         SizedBox(
                             height:5.0
                         ),
                         Text(
                           '$weight',
                           style: TextStyle(
                               fontSize: 30.0,
                               color: Colors.white,
                               fontWeight: FontWeight.w900
                           ),
                         ),
                         SizedBox(
                             height:5.0
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             FloatingActionButton(
                               onPressed:()
                               {
                                 setState(() {
                                   weight--;
                                 });
                               },
                               mini: true,
                               child:Icon(
                                   Icons.remove
                               ),
                               backgroundColor: Colors.pinkAccent,
                             ),
                             FloatingActionButton(
                               onPressed:()
                               {
                                 setState(() {
                                   weight++;
                                 });
                               },
                               mini: true,
                               child:Icon(
                                   Icons.add
                               ),
                               backgroundColor: Colors.pinkAccent,

                             ),
                           ],
                         )

                       ],
                     ),
                   ),
                   ),
                   SizedBox(
                     width: 20.0,
                   ),
                   Expanded(
                     child: Container(
                       decoration:BoxDecoration(
                           borderRadius: BorderRadius.circular(10.0),
                           color: Colors.blue[700]
                       ) ,
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             'AGE',
                             style: TextStyle(
                                 fontSize: 20.0,
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold
                             ),
                           ),
                           SizedBox(
                               height:5.0
                           ),
                           Text(
                             '$age',
                             style: TextStyle(
                                 fontSize: 30.0,
                                 color: Colors.white,
                                 fontWeight: FontWeight.w900
                             ),
                           ),
                           SizedBox(
                               height:5.0
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(
                                 onPressed:()
                                 {
                                   setState(() {
                                     age--;
                                   });
                                 },
                                 mini: true,
                                 child:Icon(
                                     Icons.remove
                                 ),
                                 backgroundColor: Colors.pinkAccent,
                               ),
                               FloatingActionButton(
                                 onPressed:()
                                 {
                                   setState(() {
                                     age++;
                                   });
                                 },
                                 mini: true,
                                 child:Icon(
                                     Icons.add
                                 ),
                                 backgroundColor: Colors.pinkAccent,

                               ),
                             ],
                           )

                         ],
                       ),
                     ),
                   ),
                     ],
                   ),
             ),
           ),
           Container(
            color: Colors.pinkAccent,
            width: double.infinity,
            child: MaterialButton(
              onPressed: ()
              {
                double result = weight / pow(height/100, 2);
                print(result.round());

                Navigator.push(context,
                MaterialPageRoute(builder: (context) => BmiResult(
                  isMale: isMale ,
                  result: result.round(),
                  age: age,

                ),
                ),
                );
              },
              child: Text(
                  'Calculate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
              ),
            ),
          ),
             ],
           ),

      );


  }
}
