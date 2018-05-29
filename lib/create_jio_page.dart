import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CreateJioPage extends StatefulWidget {
  @override
  _CreateJioPageState createState() => new _CreateJioPageState();
}

class _CreateJioPageState extends State<CreateJioPage> {
  TimeOfDay chosenTime;
  String _defaultTimeText;


  @override
  void initState() {
    chosenTime = new TimeOfDay.now();
    _defaultTimeText = "${chosenTime.hour > 12 ? chosenTime.hour - 12 : chosenTime.hour}:${chosenTime.minute} ${chosenTime.hour > 12 ? 'PM' : 'AM'}";;

  }

  // callback for showDatePicker. invoked when user tries to key in date in the form
  Future _chooseDate(BuildContext context) async {
    chosenTime = await showTimePicker(
      context: context,
      initialTime: new TimeOfDay.now(),
    );
    if (chosenTime == null) return null;
    setState(() {
      _defaultTimeText = "${chosenTime.hour > 12 ? chosenTime.hour - 12 : chosenTime.hour}:${chosenTime.minute} ${chosenTime.hour > 12 ? 'PM' : 'AM'}";
      // send this info to datastore
      //...
    });

      return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  validator: null,
                  decoration: new InputDecoration(labelText: "Where you going?", hintText: "e.g. Newton Food Center"),
                ),
                new TextFormField(
                  validator: null,
                  decoration: new InputDecoration(labelText: "Food collection point", hintText: "e.g void deck at blk 27"),
                ),

                new Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 2,
                      child: new InkWell(
                        child: new Text("close order at $_defaultTimeText",
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontSize: 20.0
                          ),
                        ),
                        onTap: () {
                          _chooseDate(context);
                        },

                      )
                    ),
                    new IconButton(
                      icon: new Icon(Icons.access_time),
                      onPressed: () {
                        _chooseDate(context);
                      }
                    )
                    
                  ],
                )


              ],
            )
        )
      ),
    );


  }
}
