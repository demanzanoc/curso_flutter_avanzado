import 'package:platzi_trips_app/user/repository/cloud_firestore_api.dart';
import '../../place/model/place.dart';
import '../model/user_model.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreApi();

  updateUserDataFirestore(UserModel user) =>
      _cloudFirestoreApi.updateUserData(user);

  Future<void> updatePlaceDate(Place place) =>
      _cloudFirestoreApi.updatePlaceData(place);
}
