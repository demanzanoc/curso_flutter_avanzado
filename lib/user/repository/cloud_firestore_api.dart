import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model.dart';

class CloudFirestoreApi {
  final String USERS = "users";
  final String PLACE = "places";

  final FirebaseFirestore _database = FirebaseFirestore.instance;

  updateUserData(UserModel user) async {
    CollectionReference usersCollection = _database.collection(USERS);
    DocumentReference documentReference = usersCollection.doc(user.id);
    return documentReference.set({
      'uid': user.id,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now(),
    }, SetOptions(merge: true));
  }
}
