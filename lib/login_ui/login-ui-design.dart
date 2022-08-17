import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Signup_ui/Signup.dart';
import '../profile.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _email, _password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Login() async
  {
    log('login fuction');
    if(_formKey.currentState!.validate())
    {
      log('validated');
      _formKey.currentState!.save();
      try
      {
        log('login try');
        var maillogin = await _auth.signInWithEmailAndPassword
        (
          email: _email.toString(), 
          password: _password.toString()
        );
        log(maillogin.additionalUserInfo.toString());
        // Navigator.push
        // (
        //   context, 
        //   MaterialPageRoute(builder: (context)=>SignUp())
        // );
        Navigator.of(context).pushAndRemoveUntil
          (
            MaterialPageRoute(builder: (context) =>Profile()), 
            (Route<dynamic> route) => false);
      }catch(e)
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

  //nav
  navigateToSignUp() async
  {
    log('navigate to signup');
    Navigator.push
    (
      context,
      MaterialPageRoute(builder: (context) => SignUp(),)
    );
  }

  //google
  Future<UserCredential> googleSignIn() async
  {
    log('google sign in');
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) 
    {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null && googleAuth.accessToken != null)
      {
        final AuthCredential credential = GoogleAuthProvider.credential
        (
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
        );
        final UserCredential user = await _auth.signInWithCredential(credential);
        log(user.toString());
        log('sign in google');
        Navigator.of(context).pushAndRemoveUntil
          (
            MaterialPageRoute(builder: (context) =>Profile()), 
            (Route<dynamic> route) => false);
        return user;
        // log(user.toString());
      }
      else
      {
        throw StateError('Missing Google Auth Token');
      }
    }
    else
      throw StateError('Sign in Aborted');
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
              Padding
              (
                padding: EdgeInsets.only(left: 25,right: 25),
                child: Column
                (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: 
                  [
                    SizedBox
                    (
                      height: 200,
                    ),
                    Align
                    (
                      alignment: Alignment.centerLeft,
                      child: Text("Welcome,",style: TextStyle(color:Colors.deepPurple,fontSize: 26,fontWeight: FontWeight.bold,),)
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text("Sign in to continue!",style: TextStyle(fontSize: 20,color: Colors.deepPurple),),
                    
                    //form
                    Padding
                    (
                      padding: EdgeInsets.symmetric
                      (
                        horizontal: 8,
                        vertical: 16
                      ),
                      child: Container
                      (
                        child: Form
                        (
                          key: _formKey,
                          child: Column
                          (
                            children: 
                            [
                              //email
                              TextFormField
                              (
                                textInputAction: TextInputAction.next,
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
                                          color:Colors.purple
                                        )
                                    ),
                                  ),
                                validator: (email)
                                {
                                  if(email!.isEmpty)
                                  {
                                    return 'Please enter email id';
                                  }
                                },
                                onSaved: (email)=> _email = email,
                              ),

                              SizedBox(height: 16,),

                              //pass
                              TextFormField
                              (
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    labelText: "Password",
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
                                          color:Colors.purple
                                        )
                                    ),
                                  ),
                                validator: (email)
                                {
                                  if(email!.isEmpty)
                                  {
                                    return 'Please enter Password';
                                  }
                                },
                                onSaved: (password)=> _password = password,
                              ),

                              SizedBox
                              (
                                height: 30,
                              ),
                              Container
                              (
                                height: 50,
                                width: double.infinity,
                                child: FlatButton(
                                  // onPressed: (){},
                                  onPressed: Login,
                                  padding: EdgeInsets.all(0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                            Colors.purple,
                                            Colors.purpleAccent
                                          // Color(0xffff5f6d),
                                          // Color(0xffff5f6d),
                                          // Color(0xffffc371),
                                        ],
                                      ),
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      constraints: BoxConstraints(maxWidth: double.infinity,minHeight: 50),
                                      child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),

                              SizedBox(height: 16,),

                              //connect google

                              Container
                              (
                                  height: 50,
                                  width: double.infinity,
                                  child: FlatButton(
                                    // onPressed: (){},
                                    onPressed: googleSignIn,
                                    color: Colors.indigo.shade50,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset('assets/images/app_logo.png',height: 18,width: 18,),
                                        SizedBox(width: 10,),
                                        Text("Connect with Google",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: 16,),

                                //account design
                                Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account?",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey.shade400),),
                          SizedBox(width: 5,),
                          GestureDetector(
                            onTap: navigateToSignUp,
                            child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple),),
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