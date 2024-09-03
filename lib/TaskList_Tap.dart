import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/ThemeData/ThemeData.dart';

import 'Item_task.dart';
import 'ThemeData/ThemeData.dart';

class taskListTap extends StatelessWidget {
  const taskListTap({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: ListView.builder(
            itemBuilder: (context, index) => itemTask(),
            itemCount: 2,
          ),
        )
      ],
    );
  }
}
