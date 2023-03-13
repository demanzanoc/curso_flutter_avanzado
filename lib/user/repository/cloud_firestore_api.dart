import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../place/model/place.dart';
import '../../place/ui/widgets/card_image_with_fab_icon.dart';
import '../model/user_model.dart';
import '../ui/widgets/profile_place.dart';

class CloudFirestoreApi {
  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore _database = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  updateUserData(UserModel user) async {
    CollectionReference usersCollection = _database.collection(USERS);
    DocumentReference documentReference = usersCollection.doc(user.id);
    return await documentReference.set({
      'uid': user.id,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now(),
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference placesCollection = _database.collection(PLACES);
    String userId = await _auth.currentUser.uid;
    await placesCollection.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'urlImage': place.urlImage,
      'userOwner': _database.doc("$USERS/$userId"),
    }).then((document) => {
          document.get().then((snapshot) => {
                _database.collection(USERS).doc(userId).update({
                  'myPlaces': FieldValue.arrayUnion(
                      [_database.doc("$PLACES/${snapshot.id}")])
                })
              })
        });
  }

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      placesListSnapshot.map((place) => ProfilePlace(
            place: Place(
              name: place['name'],
              description: place['description'],
              urlImage: place['urlImage'],
              likes: place['likes'],
            ),
          )).toList();

  List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesList) =>
      placesList.map((place) => CardImageWithFabIcon(
        pathImage: place["urlImage"],
        isNetworkImage: true,
        onPressedFabIcon: () {
          likePlace(place.id);
        },
      )).toList();

  Future likePlace(String idPlace) async {
    int likes = 0;
    await _database.collection(PLACES).doc(idPlace).get().then(
            (place) => {
              likes = place['likes'],
              _database.collection(PLACES).doc(idPlace).update({
                'likes': likes+1
              })

            }
    );
  }

}
