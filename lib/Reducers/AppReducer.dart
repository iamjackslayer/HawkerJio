import 'package:hawker_jio_app/Actions/AuthenticationActions.dart';
import 'package:hawker_jio_app/core.dart';

AppState appReducer(AppState state, dynamic action) {
  print(action);
  if (action is AuthenticationAction) {
    if (action is LoginAction) {
      return AppState(AppStatusFlags.authenticated,action.user,null,null,null);
    }
  } else {
  }
  return AppState(AppStatusFlags.unauthenticated,null,null,null,null);
}