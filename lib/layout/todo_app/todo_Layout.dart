import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/layout/todo_app/cubit/cubit.dart';
import 'package:untitled1/layout/todo_app/cubit/states.dart';

class todo_Layout extends StatelessWidget
{

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var titleController =TextEditingController();
  var timeController =TextEditingController();
  var dateController =TextEditingController();
  var formKey =GlobalKey<FormState>();

  todo_Layout({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>  AppCubit()..createDataBase() ,
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state)
        {
          if (state is AppInsertDataBaseState)
            {
              Navigator.pop(context);
            }
        },
        builder: (BuildContext context,AppStates state)
        {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.deepPurpleAccent,
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: ConditionalBuilder
              (
              condition: state is! AppGetDataBaseLoadingState,
              builder: (context)=> cubit.screens[cubit.currentIndex],
              fallback:(context)=>const Center(child: CircularProgressIndicator()),

            ),
            floatingActionButton: FloatingActionButton(
              onPressed: ()
              {
                if(cubit.isBottomSheetShown)
                {
                  if(formKey.currentState!.validate())
                  {
                    cubit.insertToDataBase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    );

                  }
                }
                else
                {
                  scaffoldKey.currentState!.showBottomSheet(
                          (context) => Container(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.title),
                                      prefixIconColor: Colors.deepPurpleAccent,
                                      labelText: 'Enter Task Title',
                                      labelStyle: const TextStyle(
                                          color: Colors.deepPurpleAccent
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:BorderRadius.circular(20.0),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepPurpleAccent
                                          )
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.deepPurpleAccent,

                                          )
                                      )
                                  ),
                                  controller: titleController,
                                  validator: (value)
                                  {
                                    if(value == null || value.isEmpty)
                                    {
                                      return'Title must be filled';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                ),
                                const SizedBox(
                                    height: 15.0),
                                TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.watch_later_outlined),
                                      prefixIconColor: Colors.deepPurpleAccent,
                                      labelText: 'Enter Task Time',
                                      labelStyle: const TextStyle(
                                          color: Colors.deepPurpleAccent
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:BorderRadius.circular(20.0),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepPurpleAccent
                                          )
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.deepPurpleAccent,

                                          )
                                      )
                                  ),
                                  controller: timeController,
                                  validator: (value)
                                  {
                                    if(value == null || value.isEmpty)
                                    {
                                      return'Time must be filled';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.datetime,
                                  onTap: ()
                                  {
                                    showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now()).then((value)
                                    {
                                      timeController.text=value!.format(context).toString();
                                    }
                                    );

                                  },
                                ),
                                const SizedBox(
                                    height: 15.0),
                                TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.date_range_outlined),
                                      prefixIconColor: Colors.deepPurpleAccent,
                                      labelText: 'Enter Task Date',
                                      labelStyle: const TextStyle(
                                          color: Colors.deepPurpleAccent
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:BorderRadius.circular(20.0),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepPurpleAccent
                                          )
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.deepPurpleAccent,

                                          )
                                      )
                                  ),
                                  controller: dateController,
                                  validator: (value)
                                  {
                                    if(value == null || value.isEmpty)
                                    {
                                      return'Date must be filled';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.datetime,
                                  onTap: ()
                                  {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2023-05-03'),
                                    ).then((value)
                                    {
                                      dateController.text=DateFormat.yMMMd().format(value!);
                                    }
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ).closed.then((value)
                  {
                    cubit.changeBottomSheet(isShown:false, icon: Icons.edit);

                  });
                  cubit.changeBottomSheet(isShown:true, icon: Icons.add);
                }
              },
              backgroundColor: Colors.deepPurpleAccent,
              child: Icon(
                  cubit.fabIcon
              ),
            ),
            bottomNavigationBar:BottomNavigationBar(
              selectedItemColor: Colors.deepPurpleAccent,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeIndex(index);
              },
              elevation: 30.0,
              items:
              const [
                BottomNavigationBarItem(
                  icon:Icon(Icons.menu),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.check_circle_outline_rounded),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon:Icon(Icons.archive_outlined),
                  label: 'Archived',
                ),
              ],
            ) ,
          );
        },


      ),
    );
  }





























}






















