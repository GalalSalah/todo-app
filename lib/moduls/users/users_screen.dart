import 'package:flutter/material.dart';

class ModelUser {
  final int id;
  final String name;
  final String phone;

  ModelUser({required this.id, required this.name, required this.phone});
}

class UsersScreen extends StatelessWidget {
  List<ModelUser>users=[
    ModelUser(id: 1, name: 'Galal', phone: '01025485458'),
    ModelUser(id: 2, name: 'Ahmed', phone: '010250125458'),
    ModelUser(id: 3, name: 'Ali', phone: '01501245855'),
    ModelUser(id: 4, name: 'Belal', phone: '012425125'),
    ModelUser(id: 5, name: 'Hassan', phone: '0114522585'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (context, i) => buildUser(users[i]),
          separatorBuilder: (context, i) =>  Padding(
            padding:  EdgeInsetsDirectional.only(start: 20,end: 20),
            child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
          ),
          itemCount: users.length),
    );
  }

  Widget buildUser(ModelUser user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
             CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blue,
              child: Text(
                '${user.id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:  [
                Text(
                  '${user.name}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      );
}
