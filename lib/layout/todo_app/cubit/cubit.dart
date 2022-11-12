import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/layout/todo_app/cubit/states.dart';
import 'package:untitled1/modules/Archived_tasks/A_tasks.dart';
import 'package:untitled1/modules/Done_tasks/D_tasks.dart';
import 'package:untitled1/modules/New_tasks/N_tasks.dart';
import 'package:untitled1/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppStates());

  static AppCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;
  List<Widget> screens =
  [
    const N_tasks(),
    const D_tasks(),
    const A_tasks(),
  ];
  List<String> titles =
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks'
  ];
  late Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangBottomNavBarState());
  }

  void createDataBase() {
    openDatabase(
      'TODO.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT, time TEXT , status TEXT )'
        ).then((value) {
          print('table created');
        }
        ).catchError((error) {
          print('error in creating table $error');
        }
        );
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }


  Future insertToDataBase({
    required String title,
    required String time,
    required String date,

  }) async
  {
    await database.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks(title,date,time,status) VALUES("$title","$date","$time","new")'
      ).then((value) {
        print('$value inserted successfully');
        emit(AppInsertDataBaseState());

        getDataFromDatabase(database);
      }
      ).catchError((error) {
        print('error in inserting new record ${error.toString()}');
      }
      );
    }
    );
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppGetDataBaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        }
        if (element['status'] == 'done') {
          doneTasks.add(element);
        }
        if (element['status'] == 'archived') {
          archivedTasks.add(element);
        }
      });
      emit(AppGetDataBaseState());
    });
  }


  void updateDataBase
      ({
    required String status,
    required int id,
  }) {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        [status, id]
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDataBaseState());
    });
  }


  void deleteFromDataBase
      ({
    required int id,
  }) {
    database.rawUpdate(
        'DELETE FROM tasks WHERE id = ?', [id]
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteFromDataBaseState());
    });
  }

  void changeBottomSheet({
    required bool isShown,
    required IconData icon,
  }) {
    isBottomSheetShown = isShown;
    fabIcon = icon;
    emit(AppChangBottomSheetState());
  }

  bool isDark = false;


  void switchAppColor({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(SwitchAppModeState());
    }
    else {
      isDark = !isDark;
      CacheHelper.setBool(key: 'isDark', value: isDark).then((value) {
        emit(SwitchAppModeState());
      });
    }
  }
}
