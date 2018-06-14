import 'package:flutter/material.dart';
import 'dart:async';
import 'my_button.dart';
import 'main.dart';
import 'core.dart';
import 'package:hawker_jio_app/GoogleSignIn.dart';
import 'user_home_page.dart';
/**
 * This class is also the 'Login Page'. User logs in via Google.
 * This page contains link (or button) that routes to SignUp page.
 */



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() {
    return new _HomePageState();
  }
}


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) => StoreConnector<AppState, AppStatusFlags>(
    converter: (Store<AppState> store) => store.state.currentAppStatus,
    builder: (BuildContext context, AppStatusFlags flag) => defaultPage(flag)
  );
}
