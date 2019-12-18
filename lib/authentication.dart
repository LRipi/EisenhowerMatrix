
enum AuthState {
  disconnected,
  connected,
}

class Authentication {
  static AuthState state = AuthState.disconnected;
  static String jwtToken = '';

  static AuthState getAuthState () {
    return state;
  }

  static void setAuthState (AuthState newState) {
    state = newState;
  }

  static void setJwtToken (String token) {
    jwtToken = token;
  }

  static void disconnect () {
    setAuthState(AuthState.disconnected);
  }
}