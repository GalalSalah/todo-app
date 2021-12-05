import 'package:flutter/material.dart';
import 'package:tadoo_app/shared/cubit_todo/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
//
// Widget defaultFormField(
//     // IconData suffix,
//     //      Function onSubmit,
//     //     Function onChange,
//         {
//       Function? onSubmit,
//       required TextEditingController controller,
//       required TextInputType type,
//
//       bool isPassword = false,
//       required Function validate,
//       required String label,
//       required IconData prefix,
//
//       required Function suffixPressed,
//     }) => TextFormField(
//   controller: controller,
//   keyboardType: type,
//   onEditingComplete:()=> onSubmit,
//   // obscureText: isPassword,
//   // onFieldSubmitted: onSubmit(),
//   // onChanged: onChange(),
//   validator: validate(),
//   decoration: InputDecoration(
//     labelText: label,
//     prefixIcon: Icon(
//       prefix,
//     ),
//     // suffixIcon: suffix != null ? IconButton(
//     //   onPressed:()=> suffixPressed,
//     //   icon: Icon(
//     //     suffix,
//     //   ),
//     // ) : null,
//     border: OutlineInputBorder(),
//   ),
// );
// Widget defaultFormField2(
//     // IconData suffix,
//     //      Function onSubmit,
//     //     Function onChange,
//         {
//       required TextEditingController controller,
//       required TextInputType type,
//
//       bool isPassword = false,
//       required Function validate,
//       required String label,
//       required IconData prefix,
//
//       required Function suffixPressed,
//     }) => TextFormField(
//   controller: controller,
//   keyboardType: type,
//   obscureText: isPassword,
//   // onFieldSubmitted: onSubmit(),
//   // onChanged: onChange(),
//   validator: validate(),
//   decoration: InputDecoration(
//     labelText: label,
//     prefixIcon: Icon(
//       prefix,
//     ),
//     // suffixIcon: suffix != null ? IconButton(
//     //   onPressed:()=> suffixPressed,
//     //   icon: Icon(
//     //     suffix,
//     //   ),
//     // ) : null,
//     border: OutlineInputBorder(),
//   ),
// );

Widget defaultFormField( //   Null Function() onChange,
    //   Null Function() onSubmit,

    {
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onTap,
  // Function? onChange,
  IconData? suffix,
  Function? suffixPressed,
  bool isPassword = false,
  bool isClicked = true,
  Function? validate,
  required String label,
  required IconData prefix,
}) {
  return InkWell(
    onTap: () {
      onTap!();
    },
    child: TextFormField(
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,

      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      // onChanged: (s) {
      //   onChange!(s);
      // },
      validator: (value) {
        if (value!.isEmpty) {
          return "Value is missing";
        }
        return null;
      },

      enabled: isClicked,
      decoration: InputDecoration(
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
          labelText: label,
          prefixIcon: Icon(prefix),
          border: const OutlineInputBorder()),
    ),
  );
}

Widget taskSFromDatabase(Map model, BuildContext context) => Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(
                '${model['time']}',
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context).updateData(
                    status: 'done',
                    id: model['id'],
                  );
                },
                icon: Icon(
                  Icons.check_box,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {
                  AppCubit.get(context).updateData(
                    status: 'archive',
                    id: model['id'],
                  );
                },
                icon: Icon(
                  Icons.archive_outlined,
                  color: Colors.black45,
                )),
          ],
        ),
      ),
    );
