import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login_demo/newFile.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
   GlobalKey<FormState> _formkey= GlobalKey<FormState>();
   String? email;
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold
    (
      backgroundColor: Colors.white,
      body: SingleChildScrollView
      (
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              Container
            (
              // height: MediaQuery.of(context).size!*0.8,
              height: 780,
              // width: 400,
              width: double.infinity,
              color: Colors.pink.shade100,
              child: Form
              (
                key: _formkey,
                child: Column
                (
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  [
                    const Text('Login Form',style: TextStyle
                    (
                      fontSize: 20,

                    ),),

                    SizedBox
                    (
                      height: 20,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left:30,right: 30),
                      child: TextFormField
                      (
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.amber,
                        // cursorHeight: 50,
                        decoration: InputDecoration
                        (
                          labelText: 'Enter email',
                          labelStyle: TextStyle
                          (
                            fontSize:25,
                            fontWeight: FontWeight.w300,
                            color: Colors.deepPurple
                          ),
                          focusedBorder: OutlineInputBorder
                          (
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide
                            (
                              color: Colors.purple
                            )
                          ),
                          
                          // enabledBorder: OutlineInputBorder
                          // (
                          //   borderSide: BorderSide
                          //   (
                          //     color: Colors.purple
                          //   )
                          // ),
                        ),
                        validator: (value)
                        {
                          // var email;
                          if(email!.isEmpty)
                          {
                            print('error');
                          }
                          else
                          return null;
                        },
                      ),
                    ),
                    // Text('data'),

                    GestureDetector(
                      onTap: ()
                      {
                        log('ontap');
                        print('object');

                        //nav
                        Navigator.push
                        (
                          context, 
                          MaterialPageRoute(builder: (context)=>MyWidget())
                        );

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Container
                        (
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration
                          (
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20),)),
                        ),
                      ),
                    )
                  ],

                )
              )

            ),
            ]
          ),
        ),
      ),
    );
    
  }
}

