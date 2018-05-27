import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class JioListPage extends StatefulWidget {
  @override
  _JioListPageState createState() => new _JioListPageState();
}

class _JioListPageState extends State<JioListPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child:  new StreamBuilder(
          stream: Firestore.instance.collection('users').snapshots(),
          builder: (context, snapshot){

            if (snapshot.hasData) {
              return new ListView.builder(

                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index){
                  return new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Text("Where: ${snapshot.data.documents[index]['hawker_name']}"),
                              new Text("Pickup pt: ${snapshot.data.documents[index]['pickup_point']}"),
                            ],
                          ),
                          new Column(
                            children: <Widget>[
                              new Text("Closing time: ${snapshot.data.documents[index]['closing_time']}"),
                              new Text("ETA: ${snapshot.data.documents[index]['eta']}"),
                            ],
                          ),
                        ],
                      ),
                      new Column(
                        children: <Widget>[
                          new Text("Jio created by: ${snapshot.data.documents[index]['user_name']}"),
                        ],
                      )

                    ]
                  );
                },
              );
            } else {
              print(snapshot.connectionState);
            }
            return new CircularProgressIndicator();
          },
        ),
      )
    );

  }
}
