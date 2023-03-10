import '../../place/model/place.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final List<Place> myPlaces;
  final List<Place> myFavoritePlaces;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.photoUrl = "https://i.pinimg.com/736x/b5/49/41/b5494197b2d462c940f88988b203d290.jpg",
    this.myPlaces,
    this.myFavoritePlaces
  });
}
