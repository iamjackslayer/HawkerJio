import 'package:flutter/material.dart';
import 'delivering_from_layout.dart';

/*
* This is the first page a signed in user sees when opening the app.
* It has two big buttons, 1) letting user to choose whether to deliver food for others
* or 2) looking for available delivery services.
*/


class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => new _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> with SingleTickerProviderStateMixin {

  Color _orderButtonColor;
  Color _deliverButtonColor;
  Widget _centerLayout;

  @override
  void initState() {
    super.initState();
    _orderButtonColor = Colors.pink;
    _deliverButtonColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white70,
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
                              fontSize: 50.0
                            ),
                          ),
                        ),

                        // The center layout when orderbutton is selected.
                        new Container(
                          margin: new EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 10.0),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
                          ),

                          child: new Row(
                            children: <Widget>[
                              new Column(
                                children: <Widget>[
                                  new Padding(
                                    padding: new EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 0.0),
                                    child:new Icon(Icons.free_breakfast),
                                  ),
                                  new Padding(
                                    padding: new EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                                    child:new Icon(Icons.more_vert),
                                  ),
                                  new Padding(
                                    padding: new EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 5.0),
                                    child:new Icon(Icons.free_breakfast),
                                  ),
                                ],
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      new Text("From: ",
                                        style: new TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold
                                        ),
                                      )
                                    ],
                                  ),
                                  // This is horizontal divider
                                  new Container(
                                    margin: new EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                                    width: 220.0,
                                    height: 2.0,
                                    color: Colors.black12,
                                  ),
                                  new Row(
                                    children: <Widget>[
                                      new Text("To:",
                                          style: new TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold
                                          )
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ),


                      // This row contains two radio buttons "order" and "deliver"

                       new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          new Container(

                            child: new FlatButton(
                              child: new Container(
                                child:  new Text("Order"),
                              ),
                              onPressed: (){
                                setState(() {
                                  _orderButtonColor = Colors.pink;
                                  _deliverButtonColor = Colors.white;
                                });
                              },
                            ),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.only(topLeft: new Radius.circular(18.0), bottomLeft: new Radius.circular(18.0)),
                              color: _orderButtonColor,
                            ),
                          ),
                          //A vertical divider in between the two buttons.
                          new Container(
                            width: 2.0,
                            height: 25.0,
                            color: Colors.black12 ,
                          ),

                          new Container(
                            child: new FlatButton(
                              child: new Container(
                                child:  new Text("Deliveries"),
                                color: Colors.transparent,
                              ),
                              onPressed: (){
                                setState(() {
                                  _deliverButtonColor = Colors.pink;
                                  _orderButtonColor = Colors.white;

                                });
                              },

                            ),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.only(topRight: new Radius.circular(18.0), bottomRight: new Radius.circular(18.0)),
                              color: _deliverButtonColor,
                            ),
                          ),

                        ],
                      ),




                       // Button that navigates to another route
                        new Container(
                          margin: new EdgeInsets.only(top: 200.0  ),
                          child: new FlatButton(
                            onPressed: (){
                              if (_orderButtonColor == Colors.pink) {
                                Navigator.pushNamed(context, "/JioListPage");
                              } else if (_deliverButtonColor == Colors.pink) {

                              }
                            },
                            child: new Icon(Icons.arrow_forward_ios),

                          ),
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.all(const Radius.circular(18.0)),
                            color: Colors.white,
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
