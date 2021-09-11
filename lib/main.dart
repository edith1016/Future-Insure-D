import 'package:flutter/material.dart';
import 'state_management/appstate.dart';
import 'ui/pages/landing.dart';
import 'package:tezster_dart/tezster_dart.dart';
import 'homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TezsterDart.init();
  AppState.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: AppState.instance.updatesStream,
        builder: (context, snapshot) {
          return MaterialApp(
            navigatorKey: AppState.naviagtorKey,
            title: 'Wally XTZ',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(),
          );
        });
  }
}
