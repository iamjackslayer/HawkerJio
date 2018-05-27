import 'package:flutter/material.dart';
import 'my_button.dart';

// Firebase


class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => new _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> with SingleTickerProviderStateMixin {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: null,
        backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
      ),

      body: new Center(
              child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.all(5.0),
                          child: new Text(
                            'Hawker Jio',
                            style: new TextStyle(
                              fontSize: 20.0
                            ),
                          ),
                        ),

                        new Padding(
                          padding: new EdgeInsets.all(5.0),
                          child: new Text(
                            'I wanna get food...',
                            style: new TextStyle(
                              fontSize: 15.0,

                            ),
                          ),
                        ),

                      // Below is two Jumbo sized buttons

                        new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: new InkWell(
                            child: new MyButton('Passively', height: 180.0,),
                            onTap: () {
                              Navigator.pushNamed(context, '/JioListPage');
                            },
                          ),
                        ),
                        new Padding(
                            padding: new EdgeInsets.all(10.0),
                            child: new InkWell(
                              child: new MyButton('Actively', height: 180.0,),
                              onTap: () {
                                Navigator.pushNamed(context, '/CreateJioPage');
                              },
                            ),
                        )

                      ],
                    )
            ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
                child: new CircleAvatar(
                  child: new Text('J'),
                  backgroundColor: Color.fromRGBO(247, 64, 106, 1.0),
                ),
              
            ),
            new ListTile(
              title: new Text("Profile"),
              
            ), 
            new ListTile(
              title: new Text("Settings"),
              
            ),
            new ListTile(
              title: new Text("Account"),
            )
          ],
        ),
      ),
    );
  }
}
