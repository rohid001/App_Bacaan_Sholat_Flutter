import 'package:bacaan_sholat/page/main_page.dart';
import 'package:bacaan_sholat/providers/todo_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: MainPage(),
        initialRoute: '/',
        routes: {
          '/': (context) => MainPage(),
        },
      ),
    );
  }
}
