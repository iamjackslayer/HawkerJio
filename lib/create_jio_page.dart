import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CreateJioPage extends StatefulWidget {
  @override
  _CreateJioPageState createState() => new _CreateJioPageState();
}

class _CreateJioPageState extends State<CreateJioPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Form(
            child: new ListView(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(hintText: "Where?"),
                )
              ],
            )
        )
      ),
    );
  }
}
