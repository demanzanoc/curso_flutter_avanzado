import 'package:firebase_auth/firebase_auth.dart';
import 'package:platzi_trips_app/user/repository/firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuthApi();

  Future<User> signInWithFirebase() => _firebaseAuth.signInWithGoogle();

  signOut() => _firebaseAuth.signOut();
}
