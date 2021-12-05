import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tadoo_app/moduls/archived/archived_screen.dart';
import 'package:tadoo_app/moduls/done/done_screen.dart';
import 'package:tadoo_app/moduls/new_task/new_task_screen.dart';
import 'package:tadoo_app/shared/component/components.dart';
import 'package:tadoo_app/shared/component/constance.dart';
import 'package:tadoo_app/shared/cubit_todo/cubit.dart';
import 'package:tadoo_app/shared/cubit_todo/status.dart';

class TodoHomeScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController(text: '');
  TextEditingController timeController = TextEditingController(text: '');
  TextEditingController dateController = TextEditingController(text: '');
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  // @override
  // void dispose() {
  //   titleController.dispose();
  //   dateController.dispose();
  //   timeController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStatus>(
        listener: (context, state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = BlocProvider.of(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  final _isvValid = formKey.currentState!.validate();
                  if (_isvValid) {
                    cubit.insertToDatabase(
                        title: titleController.text,
                        date: dateController.text,
                        time: timeController.text);
                    // insertToDatabase(
                    //         title: titleController.text,
                    //         date: dateController.text,
                    //         time: timeController.text)
                    //     .then((value) {
                    //   getDataFromDatabase(database).then((value) {
                    //
                    //     // setState(() {
                    //     //   isBottomSheetShown = false;
                    //     //   fabIcon = Icons.edit;
                    //     //   tasks=value;
                    //     // });
                    //   });
                    // });
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          // width: double.infinity,
                          // height: 120,
                          // color: Colors.grey[300],
                          padding: EdgeInsets.all(30),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultFormField(
                                  label: 'Title',
                                  type: TextInputType.text,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'title must not be empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: titleController,
                                  prefix: Icons.title,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                  label: 'Time',
                                  isClicked: false,
                                  type: TextInputType.datetime,
                                  // isClicked: false,
                                  onTap: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) {
                                      timeController.text =
                                          value!.format(context).toString();
                                    });
                                    print('sdasda');
                                  },
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'time must not be empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: timeController,
                                  prefix: Icons.calendar_today,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                  label: 'Date',
                                  type: TextInputType.datetime,
                                  isClicked: false,
                                  // isClicked: false,
                                  onTap: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse(
                                          '2022-12-12',
                                        )).then((value) {
                                      dateController.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                    print('sdasda');
                                  },
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return 'date must not be empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: dateController,
                                  prefix: Icons.watch_later_outlined,
                                )
                              ],
                            ),
                          ),
                        ),
                        elevation: 25,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheet(isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheet(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            body: state is AppGetDatabaseLoadingState
                ? const Center(child:  CircularProgressIndicator())
                : cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
                // setState(() {
                //   currentIndex = index;
                // });
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'archived'),
              ],
            ),
          );
        },
      ),
    );
  }
}
// async {
// txn
//     .rawInsert(
// 'INSERT INTO tasks[title, date, time, status] VALUES["first task","011","0225","new"]')
// .then((value) => print('$value inserted sucsessfully'))
// .catchError((onError) {
// print('error in inserting new record${onError.toString()}');
// });
// // return null;
// }
