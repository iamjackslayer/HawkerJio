import 'package:flutter/material.dart';
import 'jio_entry.dart';

/*This class is widget class wrapping the JioEntry obj. The resulting widget is what is gonna
* be displayed onto our jio list page.
* We wrap it in an Expansion tile.
* */
class JioEntryWidget extends StatefulWidget {
  final JioEntry jioEntry;

  JioEntryWidget(this.jioEntry);

  @override
  _JioEntryWidgetState createState() => new _JioEntryWidgetState();
}

class _JioEntryWidgetState extends State<JioEntryWidget> {
  @override
  Widget build(BuildContext context) {
    return new ExpansionTile(
      title: new Text("${widget.jioEntry.hawkerName} (closing in ${new DateTime.now().difference(widget.jioEntry.closingTime).inMinutes} mins)"),

      children: <Widget>[
        new ListTile(
          title: new Text("Pick up pt: ${widget.jioEntry.pickupPoint}"),
        ),
        new ListTile(
          title: new Text("ETA: ${widget.jioEntry.eta.hour}:${widget.jioEntry.eta.minute}"),
        ),
        new ListTile(
          title: new Text("Jio created by ${widget.jioEntry.jioCreator}"),
        )
      ],
    );
  }
}
