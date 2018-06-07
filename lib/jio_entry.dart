import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
/*This is class for creating an entry for each available Jio in the jio_list_page.
* Each JioEntry instance has information such as
* pickup_point,
* closing_time,
* hawker_name
* jio_creator,
* eta.
**/

class JioEntry {
  String pickupPoint;
  String hawkerName;
  String jioCreator;
	String remarks;
  DateTime closingTime;
  DateTime eta;



  JioEntry({
    @required this.pickupPoint,
    @required this.hawkerName,
    @required this.jioCreator,
    @required this.closingTime,
    @required this.eta
  });


}
