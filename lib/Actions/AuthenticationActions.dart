import 'package:hawker_jio_app/States/AppUser.dart';

class AuthenticationAction {

}

class LogoutAction extends AuthenticationAction {

}

class SignUpAction extends AuthenticationAction {

}

class AuthenticateWithGoogleAction extends AuthenticationAction {
  
}

class LoginAction extends AuthenticationAction {
  final AppUser user;

  LoginAction(this.user);

  bool isSuccessful() {
    return user != null;
  }
}