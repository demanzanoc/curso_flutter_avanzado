import '../../place/model/place.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  List<Place> myPlaces;
  List<Place> myFavoritePlaces;

  UserModel(this.id, this.name, this.email, this.photoUrl, this.myPlaces, this.myFavoritePlaces);

}