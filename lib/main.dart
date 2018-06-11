import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'sign_up_page.dart';
import 'user_home_page.dart';
import 'jio_list_page.dart';
import 'create_jio_page.dart';
import 'core.dart';



void main() {
  final Store<AppState> store = new Store<AppState>(
    appReducer, /* Function defined in the reducers file */
    initialState: AppState.initial(),
    middleware: [thunkMiddleware],
  );

  runApp(new MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({Key key, this.store});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
      store: store,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.green,
        ),
        home: new WelcomePage(),
        routes: <String, WidgetBuilder> {
          "/SignUpPage" : (BuildContext context) => new SignUpPage(),
          "/UserHomePage" : (BuildContext context) => new UserHomePage(),
          // "/deliverHomePage" : (BuildContext context) => new DeliverHomePage(),
          '/JioListPage' : (BuildContext context) => new JioListPage(),
          "/CreateJioPage" : (BuildContext context) => new CreateJioPage(),
        },
      )
    );
  }
}
