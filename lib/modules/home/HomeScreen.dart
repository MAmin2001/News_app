import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        excludeHeaderSemantics: false,
        foregroundColor: Colors.lightBlue,
        primary: true,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: () {
          print('Show Menu');
        }, icon: Icon(
          Icons.menu,
        )
        ),
        title: Text('-WOOzy-'),
        actions: [
          IconButton(onPressed: () {
            print('Founded');
          },
              icon: const Icon(Icons.search)),
          IconButton(onPressed: () {
            print('You have notification');
          },
              icon: Icon
                (Icons.notification_important)
          ),
          IconButton(onPressed: () {
            print('Activated');
          },
              icon: Icon
                (Icons.dark_mode)
          ),
          IconButton(onPressed: () {
            print('Translated');
          }, icon: Icon
            (Icons.g_translate)
          ),
        ],
      ),
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: 300.0,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                      image: NetworkImage('https://images.unsplash.com/photo-1654886357555-58f98333f119?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                      width: 300.0,
                      height: 300.0,
                      fit: BoxFit.cover,

                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.5),
                    child:
                       Text(
                          'YNWA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      )
                      )
                    ),

                ],
              ),
            ),

          ],
        )
      ),
    );
    
  }
}









