import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_psi/providers/data_provider.dart';
import 'package:test_psi/providers/question_provider.dart';
import 'package:test_psi/routes/router.dart';
import 'package:test_psi/theme/app_theme.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final questionProvider = Provider.of<QuestionProvider>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuestionProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => DataProvider(),
          lazy: false,
        )
      ],
      // builder: (BuildContext context, child) {
      //   print(questionProvider.dataReceived);
      //   return const MyApp();
      // },
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEST',
      initialRoute: MainRouter.initialRoute,
      routes: MainRouter.routes,
      theme: AppTheme.mainTheme,
    );
  }
}
