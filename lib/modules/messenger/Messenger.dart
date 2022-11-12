//import 'dart:html';

import 'package:flutter/material.dart' ;

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: const [
            CircleAvatar (
              radius: 25.0,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1662016745698-910f10da2ff8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
            ),
             SizedBox(
               width: 15.0,
             ),
             Text(
                'Chats',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        actions: [
          IconButton(onPressed:()
          {

          } ,
              icon:const CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.green,
                child: Icon(
                    Icons.camera_alt,
                  size: 20.0,
                  color: Colors.white,
                ),
              )
          ),
          IconButton(onPressed:()
          {

          } ,
              icon:const CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.edit,
                  size: 20.0,
                  color: Colors.white,
                ),
              )
          ),
        ],  // actions
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[300]
                    ),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){},
                            icon: const Icon(
                            Icons.search,
                            )
                        ),
                        const Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 15.0
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 120.0,
                    child: ListView.separated(
                      shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context,index) => buildStoryItem(),
                        separatorBuilder:(context,index) => SizedBox(width: 10),
                        itemCount: 10
                    ),
                  ),
                  SizedBox(
                      height: 20.0
                  ),
                   ListView.separated(
                     physics:NeverScrollableScrollPhysics() ,
                     shrinkWrap: true,
                        itemBuilder: (context,index) => buildChatItem(),
                        separatorBuilder: (context,index) => SizedBox(height: 20),
                        itemCount: 10
                    ),




                ],
              ),
        ),
        ),
      );
  }


  Widget buildChatItem() =>  Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: const [
          CircleAvatar (
            radius: 35.0,
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1662016745698-910f10da2ff8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
          ),
          Padding(
            padding:EdgeInsetsDirectional.only(
                bottom: 3,
                end: 3
            ),
            child: CircleAvatar (
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      const SizedBox(
        width: 10.0,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Marwan Mohamed',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Hello my uncle , how are you,i missed you',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7.0),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const Text(
                    '06:00 PM'
                ),


              ],
            )
          ],
        ),
      )


    ],
  ) ;

  Widget buildStoryItem() => Container(
    width: 70.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: const [
            CircleAvatar (
              radius: 35.0,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1662016745698-910f10da2ff8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
            ),
            Padding(
              padding:EdgeInsetsDirectional.only(
                  bottom: 3,
                  end: 3
              ),
              child: CircleAvatar (
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 7.0,
        ),
        const Text(
          'Mahmoud Amin Mostafa',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )

      ],
    ),
  ) ;





}
