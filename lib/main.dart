import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/profile.dart';
import 'login_ui/login-ui-design.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Login(),
      // home: Profile(),
    );
  }
}

