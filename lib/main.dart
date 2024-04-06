import 'package:firebase_core/firebase_core.dart';
import 'package:project_1/screen/mainlayout.dart';
import 'style/style.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import 'test/testScreening.dart';

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
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: background,
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: white, displayColor: white),
        useMaterial3: true,
      ),
      home: MainLayout(),
    );
  }
}
