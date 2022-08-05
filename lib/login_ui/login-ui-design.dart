import 'dart:developer';

import 'package:flutter/material.dart';

class LoginDesign extends StatefulWidget {
  LoginDesign({Key? key}) : super(key: key);

  @override
  State<LoginDesign> createState() => _LoginDesignState();
}

class _LoginDesignState extends State<LoginDesign> {
  String? _email,_password;
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Colors.lightBlue.shade100,
      body: SingleChildScrollView
      (
        child: Container
        (
          child: Padding(
            padding: const EdgeInsets.only(left:25.0,right: 25),
            child: Column
            (
              children: 
              [
                SizedBox
                (
                  height: 200,
                ),

                Container
                (
                  height: 300,
                  width: double.infinity,
                  // color: Colors.red,
                  decoration: BoxDecoration
                  (
                    image: DecorationImage
                    (
                      image: NetworkImage('https://thumbs.dreamstime.com/b/login-banner-template-ribbon-label-sign-177646419.jpg')
                    )
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text
                  (
                    'Welcome',
                    style: TextStyle
                    (
                      fontSize: 20
                    ),
                  ),
                ),
                SizedBox
                (
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text
                  (
                    'Login to continue',
                    style: TextStyle
                    (
                      fontSize: 15
                    ),
                  ),
                ),

                Container
                (
                  child: Form
                  (
                    key: _formkey,
                    child: Column
                    (
                      children: 
                      [
                        SizedBox
                        (
                          height: 20,
                        ),
                        TextFormField
                        (
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration
                          (
                            labelText: 'Enter email',
                            labelStyle: TextStyle
                            (
                              fontSize: 16,
                              color: Colors.deepPurple
                            ),
                            errorBorder: OutlineInputBorder
                            (
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide
                              (
                                color: Colors.purple
                              )
                            ),
                            enabledBorder: OutlineInputBorder
                            (
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide
                              (
                                color: Colors.purple
                              )
                            ),
                            focusedBorder: OutlineInputBorder
                            (
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide
                              (
                                color: Colors.purple
                              )
                            ),
                          ),
                          validator: (email)
                          {
                            if(email!.isEmpty)
                            {
                              return 'Enter ur mailid';
                            }
                          },
                          onSaved: (email)
                          {
                            _email=email;
                          },
                        ),

                        SizedBox
                        (
                          height: 30,
                        ),

                        //pass
                        TextFormField
                        (
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration
                          (
                            labelText: 'Enter Password',
                            labelStyle: TextStyle
                            (
                              fontSize: 16,
                              color: Colors.deepPurple
                            ),
                            errorBorder: OutlineInputBorder
                            (
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide
                              (
                                color: Colors.purple
                              )
                            ),
                            enabledBorder: OutlineInputBorder
                            (
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide
                              (
                                color: Colors.purple
                              )
                            ),
                            focusedBorder: OutlineInputBorder
                            (
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide
                              (
                                color: Colors.purple
                              )
                            ),
                          ),
                          validator: (pass)
                          {
                            if(pass!.isEmpty)
                            {
                              return 'Enter ur pass';
                            }
                          },
                          onSaved: (pass)
                          {
                            _password=pass;
                          },
                        ),

                        SizedBox
                        (
                          height: 30,
                        ),

                        //button
                        Container
                        (
                          height: 50,
                          width: double.infinity,
                          // color: Colors.amber,
                          child: FlatButton
                          (
                            //valid
                            onPressed: ()
                            {
                              print('login clicked');
                              if(_formkey.currentState!.validate())
                              {
                                log('Login');
                              }
                            }, 
                            child: Ink
                            (
                              decoration: BoxDecoration
                              (
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient
                                (
                                  colors: 
                                  [
                                    Colors.purple,
                                    Colors.pinkAccent
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight
                                ) 
                              ),
                              //txt
                              child: Container
                              (
                                alignment: Alignment.center,
                                constraints: BoxConstraints
                                (
                                  maxHeight: double.infinity,
                                  minHeight: 50
                                ),child: Text('Login'),
                              ),
                              
                            ),
                            shape: RoundedRectangleBorder
                            (
                              borderRadius: BorderRadius.circular(6)
                            ),
                          ),
                          
                        ),
                        SizedBox
                        (
                          height: 30,
                        ),

                        Padding
                        (
                          padding:EdgeInsets.only(bottom: 10,left: 20),
                          child: Container(
                            height: 20,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Don\'t have an account?',
                                style: TextStyle
                                (
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                
                                ),
                                SizedBox
                                (
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: ()
                                  {
                                    log('login button');
                                  },
                                  child: Text('Login',
                                  style: TextStyle
                                  (
                                    color: Colors.purple,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        // RichText
                        // (
                        //   text: TextSpan
                        //   (
                        //     children:
                        //     [
                        //       TextSpan
                        //       (
                        //         text: 'Hello Wlcome to Google',
                        //         style: TextStyle
                        //         (
                        //           color: Colors.red
                        //         )
                        //       ),
                        //       TextSpan
                        //       (
                        //         text: 'Facebook',
                        //         style: TextStyle
                        //         (
                        //           color: Colors.black
                        //         )
                        //       )
                        //     ] 
                        //   )
                        // )
                        
                      ],
                    )
                  ),
                ),

                
                

              ],
            ),
          ),
        ),
      ),
    );
  }
}