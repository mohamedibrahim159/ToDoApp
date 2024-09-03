import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ThemeData/ThemeData.dart';

class itemTask extends StatelessWidget {
  const itemTask({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: my_theme.whitecolor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(

                color: my_theme.primaryLightcolor,
                height: 80,
                width: 4,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("play pasket ball",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 18,
                      color: my_theme.primaryLightcolor,
                    ),),
                    SizedBox(
                      height: 7,
                    ),
                    Text("data",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 12,
                      color: my_theme.blackcolor,
                      fontWeight: FontWeight.w400
                    )),
                
                  ],
                ),
              ),
              Container(
                padding:  EdgeInsets.symmetric(vertical: 7,
                horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: my_theme.primaryLightcolor
                ),
                child: Icon(Icons.check,color: my_theme.whitecolor,size: 40 ,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
