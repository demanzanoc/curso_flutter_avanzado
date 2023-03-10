import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/user/model/user_model.dart';
import 'package:platzi_trips_app/user/repository/auth_repository.dart';
import 'package:platzi_trips_app/user/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/user/repository/cloud_firestore_repository.dart';

import '../../place/model/place.dart';
import '../ui/widgets/profile_place.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  final _firebaseStorageRepository = FirebaseStorageReporitory();

  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();

  Stream<User> get authStatus => streamFirebase;

  Future<User> signIn() => _auth_repository.signInWithFirebase();

  signOut() => _auth_repository.signOut();

  updateUserData(UserModel user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  Future<void> updatePlaceDate(Place place) =>
      _cloudFirestoreRepository.updatePlaceDate(place);

  Future<User> get currentUser async => FirebaseAuth.instance.currentUser;

  Future<UploadTask> uploadFile(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance
      .collection(CloudFirestoreApi().PLACES)
      .snapshots();

  Stream<QuerySnapshot> get placesStream => placesListStream;

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildPlaces(placesListSnapshot);

  Stream<QuerySnapshot> myPlacesListStream(String uid) => FirebaseFirestore
      .instance
      .collection(CloudFirestoreApi().PLACES)
      .where("userOwner",
          isEqualTo: FirebaseFirestore.instance
              .doc("${CloudFirestoreApi().USERS}/$uid"))
      .snapshots();

  @override
  dispose() {
    // TODO: implement dispose
  }
}
