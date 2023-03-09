import '../../user/model/user_model.dart';

class Place {
  final String id;
  final String name;
  final String description;
  final String urlImage;
  final int likes;
  final UserModel userOwner;

  Place({
    this.id,
    this.name,
    this.description,
    this.urlImage,
    this.likes,
    this.userOwner
  });
}
