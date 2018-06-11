import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hawker_jio_app/Actions/AuthenticationActions.dart';
import 'package:hawker_jio_app/core.dart';

  final authenticateWithGoogle = (Store<AppState> store) async {
    LoginAction login = new LoginAction(await _authenticate());
    if (login.isSuccessful() == true) {
      store.dispatch(login);
    } else {
      print('Login failed');
    }
  };

  Future<FirebaseUser> _handleSignIn() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    GoogleSignIn _googleSignIn = new GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    print("signed in " + user.displayName);
    return user;
  }

  Future<AppUser> _authenticate() async {
    try {
      final FirebaseUser googleUser = await _handleSignIn();
      if (googleUser != null) {
        return new AppUser(googleUser.displayName, googleUser.email, googleUser.uid);
      } else {
        print('Login Failed');
        return null;
      }
    } catch(error) {
      print(error);
      return null;
    }
  }