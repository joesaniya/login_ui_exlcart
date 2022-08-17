import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/login_ui/login-ui-design.dart';
import 'package:login_demo/profile.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _obscureText = true;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    //firbase
    FirebaseAuth _auth = FirebaseAuth.instance;

  String? _name, _email, _password,_image;

  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  //name
  Widget nameInput(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Name",
        labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            // color: Colors.grey.shade300,
            color:Colors.purple
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              // color: Colors.red,
              color: Colors.purple
            )
        ),
      ),
      validator: (email) {
        if (email!.isEmpty)
          return 'Please Enter username';
        // else if (EmailValidator.validate(email))
        //   return 'Enter valid email address';
        else
          return null;
      },
      onSaved: (name)=> _name = name,
      textInputAction: TextInputAction.next,
    );
  }

  //email
  Widget emailInput(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email ID",
        labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            // color: Colors.grey.shade300,
            color:Colors.purple
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              // color: Colors.red,
              color: Colors.purple
            )
        ),
      ),
      validator: (email) {
        if (email!.isEmpty)
          return 'Please Enter email ID';
        // else if (EmailValidator.validate(email))
        //   return 'Enter valid email address';
        else
          return null;
      },
      onSaved: (email)=> _email = email,
      textInputAction: TextInputAction.next,
    );
  }

  //password
    Widget passInput(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(fontSize: 14,color: Colors.grey.shade400),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            // color: Colors.grey.shade300,
            color: Colors.purple
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            // color: Colors.grey.shade300,
            color: Colors.purple
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            // color: Colors.red,
            color: Colors.purple
          )
        ),
        suffixIconColor:Colors.purple,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _toggle,
        ),
      ),
      validator: (input) {
                            if (input!.length < 6)
                              return 'Provide Minimum 6 Character';
                          },
      // validator: (password){
      //   Pattern pattern =
      //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      //   RegExp regex = RegExp(pattern.toString());
      //   if (password!.isEmpty){
      //     return 'Please Enter Password';
      //   }else if (!regex.hasMatch(password))
      //     return 'Enter valid password';
      //   else
      //     return null;
      // },
      onSaved: (password)=> _password = password,
      textInputAction: TextInputAction.done,
      obscureText: _obscureText,
    );
  }

  //function
  RegisterModal() async
  {
    if(_formKey.currentState!.validate())
    {
      log('registerModal');
      _formKey.currentState!.save();
      try
      {
        log('try modal');
        UserCredential user = await _auth.createUserWithEmailAndPassword
        (
          email: _email.toString(), 
          password: _password.toString()
        );
        if(user !=null)
        {
          log('signup');
          log(user.toString());
          await _auth.currentUser!.updateProfile(displayName: _name);
          log('updated');
          log(user.toString());
          // Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Profile()),
          // );
          Navigator.of(context).pushAndRemoveUntil
          (
            MaterialPageRoute(builder: (context) =>Profile(user: user.user,)), 
            (Route<dynamic> route) => false);
        }
      }
      catch(e)
      {
        showError(e.toString());
        log(e.toString());
      }
    }
  }

  //errror
    showError(String errormessage) {
    print('show error');
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.white)),
            backgroundColor: Colors.purple,
            shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK',style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Colors.white,
      body: SingleChildScrollView
      (
        child: Container
        (
          child: Column
          (
            children: 
            [
              Padding(
                padding: EdgeInsets.only(left: 25,right: 25),
                child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox
                          (
                            height: 200,
                          ),
                          SizedBox(height: 50,),
                          Align
                          (
                            alignment: Alignment.centerLeft,
                            child: Text
                            (
                              "Register Your Walet,",
                                style: TextStyle
                                (
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple
                                ),
                              )
                            ),
                            SizedBox(height: 6,),
                            Text
                            (
                              "Start Your Saving Account Wallet!",
                              style: TextStyle
                              (
                                fontSize: 20,
                                color: Colors.purple
                              ),
                            ),

                            //form
                            Padding
                            (
                              padding: EdgeInsets.symmetric
                              (
                                vertical: 16,
                                horizontal: 32,
                              ),
                              //form Container
                              child: Container
                              (
                                child: Form
                                (
                                  key: _formKey,
                                  child: Column
                                  (
                                    children: 
                                    [
                                      nameInput(),
                                    SizedBox
                                    (
                                      height: 16,
                                    ),
                                    emailInput(),
                                    SizedBox
                                    (
                                      height: 16,
                                    ),
                                    passInput(),
                                    SizedBox
                                    (
                                      height: 36,
                                    ),
                                    Container(
                                        height: 50,
                                        width: double.infinity,
                                        child: FlatButton(
                                          onPressed: RegisterModal,
                                          padding: EdgeInsets.all(0),
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6),
                                              gradient: LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  Colors.deepPurple,
                                                  Colors.deepPurpleAccent
                                                  // Color(0xffff5f6d),
                                                  // Color(0xffff5f6d),
                                                  // Color(0xffffc371),
                                                ],
                                              ),
                                            ),
                                            child: Container(
                                              alignment: Alignment.center,
                                              constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                                              child: Text("Register",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                        ),
                                      ),

                                      SizedBox
                                      (
                                        height: 16,
                                      ),

                                      //text
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text("Have an account?",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey.shade400),),
                                            SizedBox(width: 5,),
                                            GestureDetector(
                                              onTap: ()
                                              {
                                                Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => Login()),
                                                    );
                                              },
                                              child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ),
                              ),
                            )
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}