import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddTaskBottomSheet.dart';
import 'SettingTap.dart';
import 'TaskList_Tap.dart';
import 'ThemeData/ThemeData.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do List",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (index) {
          selectedindex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              label: "",
              icon: ImageIcon(AssetImage("assets/images/icon_list.png"),
                  size: 24)),
          BottomNavigationBarItem(
              label: "",
              icon: ImageIcon(
                AssetImage("assets/images/icon_settings.png"),
                size: 24,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: my_theme.primaryLightcolor,
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 6)),
        onPressed: () {
          addTaskBottomSheet();
          setState(() {});
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body:tabs[selectedindex] ,
    );
  }
List<Widget>tabs=[
  taskListTap(),
  settingTap()
];
  void addTaskBottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      context: context,
      builder: (context) => AddTaskBottomSheet(),
    );
  }
}
