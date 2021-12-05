import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tadoo_app/moduls/archived/archived_screen.dart';
import 'package:tadoo_app/moduls/done/done_screen.dart';
import 'package:tadoo_app/moduls/new_task/new_task_screen.dart';
import 'package:tadoo_app/shared/cubit_todo/status.dart';

class AppCubit extends Cubit<AppStatus> {
  AppCubit() : super(AppInitialStatus());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  List<Widget> screen = [
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchivedTaskScreen(),
  ];
  late Database database;
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarStatus());
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('create database');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time Text,status TEXT)')
            .then((value) => print('table created'))
            .catchError((e) {
          print('error when created table ${e.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase(
      {required String title,
      required String date,
      required String time}) async {
    await database.transaction((txn) => txn
            .rawInsert(
                'INSERT INTO tasks(title, time, date, status) VALUES("$title","$time","$date","new")')
            .then((value) {
          print('$value inserted successfully');
          emit(AppInsertDatabaseState());
          getDataFromDatabase(database);
        }).catchError((onError) {
          print('error in inserting new record${onError.toString()}');
        }));
  }

  void getDataFromDatabase(database) {
     newTasks=[];
     doneTasks=[];
     archivedTasks=[];
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      // newTasks=value;
      // print(newTasks);
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
         archivedTasks.add(element);
        }
      });
      emit(AppGetDatabaseState());
    });
  }

  IconData fabIcon = Icons.edit;
  bool isBottomSheetShown = false;

  void changeBottomSheet({required bool isShow, required IconData icon}) {
    fabIcon = icon;
    isBottomSheetShown = isShow;
    emit(AppChangeBottomSheetStatus());
  }

  void updateData({required String status, required int id}) async {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }
  void deleteData({ required int id}) async {
    database.rawDelete(
      'DELETE FROM tasks WHERE id = ?', [id],
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }
}
