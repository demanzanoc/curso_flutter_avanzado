import 'package:platzi_trips_app/user/repository/cloud_firestore_api.dart';
import '../model/user_model.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreApi = CloudFirestoreApi();

  updateUserDataFirestore(UserModel user) => _cloudFirestoreApi.updateUserData(user);
}
