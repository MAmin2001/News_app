import 'package:flutter/material.dart';
import 'package:untitled1/models/usermodel/user-model.dart';



class UsersScreen extends StatelessWidget {

  List<UserModel> users=[
    UserModel(id: 1,
        name: 'Mahmoud Amin',
        phone: '01011722872'),
    UserModel(id: 2,
        name: 'Mohamed Amin',
        phone: '01011992872'),
    UserModel(id: 3,
        name: 'Marwan amin',
        phone: '01011729972'),
    UserModel(id: 4,
        name: 'Malek Amin',
        phone: '01011722899'),
    UserModel(id: 5,
        name: 'Mahmoud Amin',
        phone: '01011722872'),
    UserModel(id: 6,
        name: 'Mohamed Amin',
        phone: '01011992872'),
    UserModel(id: 7,
        name: 'Marwan amin',
        phone: '01011729972'),
    UserModel(id: 8,
        name: 'Malek amin',
        phone: '01011722899'),
  ];

   UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
              style: TextStyle(
            fontSize: 30.0
        ),
        ),
      centerTitle: true,
      ),
      body:
        ListView.separated(
            itemBuilder :(context,Index)=>buildUserItem(users[Index]),
            separatorBuilder:(context,Index)=>Container(
             width: double.infinity,
             height: 1.0,
             color: Colors.grey[300],
         ),
            itemCount: users.length


    )
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Expanded(
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            child: Text(
              '${user.id}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${user.name}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,

                ),
              ),
              Text(
                '${user.phone}',
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey
                ),
              )

            ],
          )
        ],

      ),
    ),
  );
}

