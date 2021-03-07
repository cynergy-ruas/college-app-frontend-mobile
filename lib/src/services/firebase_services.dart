import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  User get user => auth.currentUser;

  Future<String> get token => auth.currentUser.getIdToken();

  bool get isLoggedIn =>
      auth.currentUser != null && auth.currentUser.getIdToken() != null;

  Future<User> signInWithCustomToken(var token) async {
    var authCredentials = await auth.signInWithCustomToken(token);
    return authCredentials.user;
  }
}
