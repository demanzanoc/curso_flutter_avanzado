import '../../user/model/user_model.dart';

class Place {
  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  UserModel userOwner;

  Place(this.id, this.name, this.description, this.urlImage, this.likes, this.userOwner);
}