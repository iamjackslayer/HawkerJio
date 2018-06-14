import 'app_user.dart';
import 'order.dart';
import 'package:hawker_jio_app/Actions/AuthenticationActions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'delivery_list.dart';
import 'hawker_center.dart';
import 'order_detail.dart';

/// Status flags of the application
enum AppStatusFlags {
  /// State of the application when no user has been signed in
  unauthenticated,
  /// State of the application when a user is signed in but has neither started nor joined an order
  authenticated,
  /// State of the application when a user is currently ordering food
  ordering,
  /// State of the application when a user is currently delivering food
  delivering
}

class AppState {
  final AppUser currentUser;
  final AppStatusFlags currentAppStatus;
  
  final List<HawkerCenter> availableHawkerCenter;
  final HawkerCenter currentHawkerCenter;
  final List<OrderDetail> openOrderList;
  final Order currentOrder;
  final DeliveryList currentDeliveryList;

  AppState._internal({
    this.currentAppStatus = AppStatusFlags.unauthenticated,
    this.currentUser = null,
    this.currentOrder = null,
    this.currentDeliveryList = null
  });

  factory AppState.initial() => new AppState._internal();
  factory AppState.loggedIn() => new AppState._internal(

  );
}
