import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app/user/repository/cloud_firestore_api.dart';
import '../../place/model/place.dart';
import '../model/user_model.dart';
import '../ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreApi();

  updateUserDataFirestore(UserModel user) =>
      _cloudFirestoreApi.updateUserData(user);

  Future<void> updatePlaceDate(Place place) =>
      _cloudFirestoreApi.updatePlaceData(place);

  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreApi.buildPlaces(placesListSnapshot);
}
