import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzi_trips_app/place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import '../../../widgets/text_input.dart';
import '../../../widgets/title_header.dart';
import '../../model/place.dart';

class AddPlaceScreen extends StatefulWidget {
  final String image;

  AddPlaceScreen(this.image);

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of(context);
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          GradientBack("", 300.0),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 45,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 10.0),
                  child: TitleHeader("Add a new place"),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: widget.image,
                    iconData: Icons.camera_alt,
                    width: 350.0,
                    height: 250.0,
                    left: 0,
                    top: 20.0,
                    isAsset: false,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextInput(
                    "Title",
                    TextInputType.text,
                    _controllerTitlePlace,
                    1,
                  ),
                ),
                TextInput(
                  "Description",
                  TextInputType.multiline,
                  _controllerDescriptionPlace,
                  4,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "Add location",
                    iconData: Icons.location_on_outlined,
                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add place",
                    onPressed: () {
                      String path;
                      userBloc.currentUser.then((User user) => {
                        path = (user != null) ? "${user.uid}/${DateTime.now()
                            .toString()}.jpg" : "",
                        userBloc.uploadFile(path, File(widget.image))
                            .then((UploadTask task) =>
                        {
                          task.then((snapshot) =>
                          {
                            snapshot.ref.getDownloadURL()
                                .then((urlImage) =>
                            {
                              userBloc.updatePlaceDate(
                                Place(
                                  name: _controllerTitlePlace.text,
                                  description: _controllerDescriptionPlace.text,
                                  urlImage: urlImage,
                                  likes: 0,
                                ),
                              ).whenComplete(() =>
                              {
                                print("TERMINO"),
                                Navigator.pop(context),
                              },
                              )},
                            )},
                          ),
                        })
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
