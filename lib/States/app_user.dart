import 'dart:async';
import 'package:flutter/material.dart';

/// Encapsulates all necessary information about a user of the application.
class AppUser {

  String _name;
  String _uid;
  String _email;
  
  /// default constructior for the AppUser class, resets all flags to false 
  /// and all else to 'null'
  AppUser(this._name,this._email,this._uid);

  factory AppUser.initial() => AppUser(null,null,null);

}