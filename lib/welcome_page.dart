import 'package:flutter/material.dart';
import 'dart:async';
import 'my_button.dart';
/**
 * This class is also the 'Login Page'. User logs in via Facebook.
 * This page contains link (or button) that routes to SignUp page.
 */

class WelcomePage extends StatefulWidget {

  @override
  _WelcomePageState createState() {
    return new _WelcomePageState();
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
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      resizeToAvoidBottomPadding: false, // Flex widgets won't resize when the keyboard is pulled up (when typing the input text field)
                                        // This is becus our non-flex green circle (A container) is not flex,
      key: _scaffoldKey,
      body:new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(

            children: <Widget>[

              // A column of form, buttons...
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Form(
                    key: _formKey,
                    autovalidate: false,
                    child: new Column(
                      children: <Widget>[
                        // image, currently the green circle on screen
                        new Container(
                          height: screenSize.height / 2,
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new CircleAvatar(child: new Text('Hello'), radius: 100.0,)
                            ],
                          ),
                        ),

                        // email input text field
                        new TextFormField(

                          decoration: new InputDecoration(
                              hintText: 'Email:',
                              icon: new Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (String v) {},
                          controller: _emailTextController, // not used
                          onSaved: (String t){},

                        ),
                        // password input text field
                        new TextFormField(
                          controller: _passwordTextController, // not used
                          decoration: new InputDecoration(
                            hintText: 'Password',
                            icon: new Icon(Icons.apps),
                          ),
                          keyboardType: TextInputType.text,
                          validator: (String v) {},
                          obscureText: true,
                          onSaved: (String t){},
                        ),

                        new Padding(padding: new EdgeInsets.all(10.0)),

                        // sign in button
                        new InkWell(
                            child: new MyButton('Sign In'),
                            
                            onTap: () {
                              _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text('You pressed the Sign In button')));


                            },
                        ),

                        new Padding(padding: new EdgeInsets.all(10.0)),
                        // sign up button
                        new InkWell(
                          child: new MyButton('Sign Up'),

                          onTap: () {
                            _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text('You pressed the Sign Up button')));
                            Navigator.of(context).pushNamed('/SignUpPage');

                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

    );
  }
}
