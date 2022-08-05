import 'package:flutter/material.dart';

class Log extends StatefulWidget {
  const Log({Key? key}) : super(key: key);

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: SingleChildScrollView
      (
        child: Column
        (
          children: 
          [
            TextFormField
            (

            ),
            Container
            (
              child: Form
              (
                child: Column
                (

                )
              ),
              
            )
          ],
        ),
      ),
    );
  }
}