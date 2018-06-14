import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'jio_entry_widget.dart';
import 'core.dart';

/*
This is the page directed when the user wants to see any available food delivery services.
*/

class JioListPage extends StatefulWidget {
  @override
  _JioListPageState createState() => new _JioListPageState();
}

class _JioListPageState extends State<JioListPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Center(child: new Text('Available jios near you!' )),
        //automaticallyImplyLeading: false, // No leading icon
      ),
      body: new Center(
        child:  new StreamBuilder(
          stream: Firestore.instance.collection('users').snapshots(),
          builder: (context, snapshot){

            if (snapshot.hasData) {
              return new ListView.builder(

                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index){

                  OrderMetadata entry = new OrderMetadata(
                    hawkerName: snapshot.data.documents[index]['hawker_name'],
                    pickupPoint: snapshot.data.documents[index]['pickup_pt'],
                    closingTime: snapshot.data.documents[index]['closing_time'],
                    eta: snapshot.data.documents[index]['eta'],
                    jioCreator: snapshot.data.documents[index]['user_name']
                  );
                  // Create our JioEntryWidget object using the snapshot data we received.
                  var entryWidget = new JioEntryWidget(entry);
                  return entryWidget;
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
