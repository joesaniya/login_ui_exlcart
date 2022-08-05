import 'dart:ui';

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        automaticallyImplyLeading: false,
        leading: GestureDetector
        (
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios)
        ),
      ),
      body: Center(child: Text('hi',style: TextStyle(fontSize: 20),)),
    );
  }
}