import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/layout/todo_app/cubit/cubit.dart';
import 'package:untitled1/layout/todo_app/cubit/states.dart';

class A_tasks extends StatelessWidget {
  const A_tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener:(context,state){} ,
        builder: (context,state) {
          var tasks =AppCubit.get(context).archivedTasks;
          return ListView.separated(
              itemBuilder:(context,index)=>buildTaskItem(tasks[index],context),
              separatorBuilder:(context,index)=>Padding(
                padding: const EdgeInsets.only(
                  right: 15.0,
                  left: 15.0,
                ),
                child: Container(
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              itemCount: tasks.length
          );
        }
    );
  }
}
