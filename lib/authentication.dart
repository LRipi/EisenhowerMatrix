
enum AuthState {
  disconnected,
  connected,
}

class Authentication {
  static AuthState state = AuthState.disconnected;

  static AuthState getAuthState () {
    return state;
  }

  static AuthState setAuthState (AuthState newState) {
    state = newState;
  }

  static void disconnect () {
    setAuthState(AuthState.disconnected);
  }
}