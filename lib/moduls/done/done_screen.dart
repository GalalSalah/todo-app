import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadoo_app/shared/component/components.dart';
import 'package:tadoo_app/shared/cubit_todo/cubit.dart';
import 'package:tadoo_app/shared/cubit_todo/status.dart';
class DoneTaskScreen extends StatelessWidget {
  const DoneTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit,AppStatus>(

        listener: (context,state){},
        builder: (context,state){
          var tasks=AppCubit.get(context).doneTasks;
          return tasks.isEmpty
              ? const Center(
            child: Text(
              'No done tasks found',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
          )
              :ListView.separated(itemBuilder: (context, i) {
            return taskSFromDatabase(tasks[i],context);
          },
              separatorBuilder: (context, i) =>
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20,end: 20),
                    child: Container(

                      width: double.infinity, height: 1, color: Colors.grey[400],),
                  ),
              itemCount: tasks.length);
        },

      );
  }
}
