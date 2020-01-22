import 'package:flutter/material.dart';

import 'Authentification/login.dart';
import 'MatrixPage/matrix.dart';
import 'authentication.dart';

class HomePageState extends State<HomePage> {

  _updateAuthStatus () {
    setState (() {});
  }

  @override
  Widget build (BuildContext context) {
    switch (Authentication.getAuthState()) {
      case AuthState.connected:
        return MatrixPage(
          onSignOut: () => _updateAuthStatus()
        );
      case AuthState.disconnected:
      default:
        return LoginPage(
          onSignIn: () => _updateAuthStatus()
        );
    }
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState () => HomePageState ();
}