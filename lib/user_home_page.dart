import 'package:flutter/material.dart';
import 'delivering_from_layout.dart';
import 'order_layout.dart';

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

    _centerLayout = new OrderLayout();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
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
                        _centerLayout,


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
                                  _centerLayout = new OrderLayout();
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
                                  _centerLayout = new DeliveringFromLayout();

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
