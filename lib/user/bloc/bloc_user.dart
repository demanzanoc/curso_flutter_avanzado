import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/model/user_model.dart';
import 'package:platzi_trips_app/user/repository/auth_repository.dart';
import 'package:platzi_trips_app/user/repository/cloud_firestore_repository.dart';

import '../../place/model/place.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User> get authStatus => streamFirebase;

  Future<User> signIn() => _auth_repository.signInWithFirebase();

  signOut() => _auth_repository.signOut();

  updateUserData(UserModel user) => _cloudFirestoreRepository.updateUserDataFirestore(user);

  Future<void> updatePlaceDate(Place place) => _cloudFirestoreRepository.updatePlaceDate(place);

  @override
  dispose() {
    // TODO: implement dispose
  }
}
