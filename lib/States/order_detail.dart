import 'hawker_center.dart';
import 'geo_point.dart';

class OrderDetail {
  final GeoPoint pickupPoint;
  final HawkerCenter hawkerCenter;
  final String delivererUid;
  final DateTime closingTime;
  final DateTime eta;
  final String remarks;
}