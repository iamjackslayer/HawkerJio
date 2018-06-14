import 'geo_point.dart';

class HawkerCenterStall {
  String name;
}

class HawkerCenter {
  GeoPoint location;
  String name;
  List<HawkerCenterStall> stallList;
}