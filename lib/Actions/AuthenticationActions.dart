import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationAction {

}

class LogoutAction extends AuthenticationAction {

}

class SignUpAction extends AuthenticationAction {

}

class AuthenticateWithGoogleAction extends AuthenticationAction {
  
}

class LoginAction extends AuthenticationAction {
  final FirebaseUser user;

  LoginAction(this.user);

  bool isSuccessful() {
    return user != null;
  }
}