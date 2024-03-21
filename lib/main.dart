import 'package:firebase_core/firebase_core.dart';
import 'package:project_1/test/testdata.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:project_1/screen/mainlayout.dart';

import 'model/login_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainLayout(),
    );
  }
}
