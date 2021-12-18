import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData.light().copyWith(
            tabBarTheme: TabBarTheme(
                labelColor: CupertinoColors.activeBlue,
                unselectedLabelColor: CupertinoColors.inactiveGray),
            appBarTheme: AppBarTheme(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor)),
        home: HomeView());
  }
}
