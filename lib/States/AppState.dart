import 'AppUser.dart';
import 'UserOrder.dart';
import 'jio_entry.dart';
import 'package:hawker_jio_app/Actions/AuthenticationActions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

/// Status flags of the application
enum appStatusFlags {
  /// State of the application when no user has been signed in
  unAuthenticated,
  /// State of the application when a user is signed in but has neither started nor joined an order
  authenticated,
  /// State of the application when a user is currently ordering food
  ordering,
  /// State of the application when a user is currently delivering food
  delivering
}

class AppState {
  final AppUser currentUser;
  final appStatusFlags currentAppStatus;
  final UserOrder currentOrder;
  final Map<String,UserOrder> currentDeliveryList;
  /// 
  final JioEntry currentOrderInformation;
  
  AppState(this.currentAppStatus, this.currentUser, this.currentOrderInformation, this.currentOrder, this.currentDeliveryList);

  factory AppState.initial() => AppState(appStatusFlags.unAuthenticated, null, null, null, new Map<String, UserOrder>());
}
