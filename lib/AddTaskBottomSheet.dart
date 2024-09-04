import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/firebase/firebase_Utils.dart';

import 'ThemeData/ThemeData.dart';
import 'firebase/Model.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Add New Task",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: my_theme.blackcolor,
                ),
          ),
        ),
        Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (text) {
                      title = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter Task title';
                      }
                      return null;
                    },
                    decoration: InputDecoration(hintText: "Enter Task title"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (text) {
                      description = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter description';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Task Description",
                    ),
                    maxLines: 4,
                  ),
                ),
              ],
            )),
        Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.topLeft,
          child: Text(
            "Select Time :",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: my_theme.blackcolor),
          ),
        ),
        InkWell(
          onTap: () {
            pickTime();
          },
          child: Text(
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: my_theme.blackcolor,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.010,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: my_theme.primaryLightcolor),
            child: InkWell(
              onTap: () {
                addTask();
              },
              child: Icon(
                Icons.check,
                color: my_theme.whitecolor,
                size: 50,
              ),
            ))
      ]),
    );
  }

  void pickTime() async {
    var chosenDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      currentDate: DateTime.now(),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void addTask() {
    if (_formKey.currentState?.validate() == true) {
      Task task=Task(
        title: title,
        description: description,
        dateTime: selectedDate
      );
      firebaseUtils
          .addTaskToFirestore(task)
          .timeout(Duration(milliseconds: 500),
      onTimeout: () {
        print("task added successfully");
        Navigator.pop(context);
      },);
    }
  }
}
