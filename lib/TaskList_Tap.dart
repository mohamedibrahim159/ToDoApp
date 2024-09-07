import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/ThemeData/ThemeData.dart';
import 'package:todo_app/firebase/firebase_Utils.dart';
import 'TaskListitem.dart';
import 'ThemeData/ThemeData.dart';
import 'firebase/Model.dart';

class taskListTap extends StatefulWidget {
  taskListTap({super.key});

  @override
  State<taskListTap> createState() => _taskListTapState();
}

class _taskListTapState extends State<taskListTap> {
  List<Task> taskslist = [];

  @override
  Widget build(BuildContext context) {
    getallTasksTofirestore();
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 356)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: my_theme.blackcolor,
          dayColor: my_theme.blackcolor,
          activeDayColor: my_theme.whitecolor,
          activeBackgroundDayColor: my_theme.primaryLightcolor,
          dotColor: my_theme.whitecolor,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(
          child: StreamBuilder(
            stream: firebaseUtils.getTasks(),
            builder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return Center(
              //     child: CircularProgressIndicator(),
              //   );
              // }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(snapshot.error.toString()),
                    ElevatedButton(onPressed: () {}, child: Text("Try Again"))
                  ],
                );
              }
              List<Task> tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

              if (tasks.isEmpty) {
                return Text("No Tasks");
              }
              return ListView.separated(
                itemBuilder: (context, index) {
                  return taskListitem(task: taskslist[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: taskslist.length,
              );
            }
          ),
        )
      ],
    );
  }

  void getallTasksTofirestore() async {
    QuerySnapshot<Task> querySnapshot =
        await firebaseUtils.getTaskcollection().get();
    taskslist=querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    setState(() {});
  }
}
