import 'package:flutter/material.dart';
import 'dart:async';
import 'my_button.dart';
import 'main.dart';
import 'core.dart';
import 'package:hawker_jio_app/GoogleSignIn.dart';
/**
 * This class is also the 'Login Page'. User logs in via Google.
 * This page contains link (or button) that routes to SignUp page.
 */

class WelcomePage extends StatefulWidget {

  @override
  _WelcomePageState createState() {
    return new _WelcomePageState();
  }
}

class _WelcomePageViewModel {

  _WelcomePageViewModel();

  factory _WelcomePageViewModel.create(Store<AppState> store) {
    return new _WelcomePageViewModel();
  }
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _emailTextController = new TextEditingController();
  TextEditingController _passwordTextController = new TextEditingController();


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) => StoreConnector<AppState, _WelcomePageViewModel>(
    converter: (Store<AppState> store) => _WelcomePageViewModel.create(store),
    builder: (BuildContext context, _WelcomePageViewModel viewModel) => new Scaffold(
      resizeToAvoidBottomPadding: false, // Flex widgets won't resize when the keyboard is pulled up (when typing the input text field)
                                        // This is becus our non-flex green circle (A container) is not flex,
      key: _scaffoldKey,
      body:new Container(
        padding: new EdgeInsets.all(50.0),
        child: new Column(
          children: <Widget>[
            // A column of form, buttons...
            new Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Align(
                  alignment: Alignment.centerLeft,
                  child: new StoreConnector<AppState,VoidCallback>(
                      converter: (store) => () {
                        store.dispatch(authenticateWithGoogle);
                        if (store.state.currentAppStatus != appStatusFlags.unAuthenticated) {
                          Navigator.pushNamed(context, "/UserHomePage");
                        }
                      },
                      builder: (context,callback) {
                        return new RaisedButton(
                          onPressed: callback,
                        );
                      }
                    )
                  )
              ]
            )
          ],
        )
      ),
    ),
  );
}
