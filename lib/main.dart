import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'sign_up_page.dart';
import 'user_home_page.dart';
import 'jio_list_page.dart';
import 'create_jio_page.dart';
import 'place_order_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.green,
      ),
      home: new WelcomePage(),
      routes: <String, WidgetBuilder> {
        "/SignUpPage" : (BuildContext context) => new SignUpPage(),
        "/UserHomePage" : (BuildContext context) => new UserHomePage(),
        "/JioListPage" : (BuildContext context) => new JioListPage(),
        "/CreateJioPage" : (BuildContext context) => new CreateJioPage(),
        "/PlaceOrderPage" : (BuildContext context) => new PlaceOrderPage(),
      },
    );
  }
}
