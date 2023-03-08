import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:platzi_trips_app/place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import '../../../widgets/text_input.dart';
import '../../../widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;

  AddPlaceScreen(this.image);

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State {
  @override
  Widget build(BuildContext context) {
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          GradientBack("", 300.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
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
                  padding: EdgeInsets.only(top: 60.0, left: 20.0, right: 10.0),
                  child: TitleHeader("Add a new place"),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 60.0, bottom: 20.0),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: "assets/img/mountain.jpeg",
                    //widget.image.path,
                    iconData: Icons.camera_alt,
                    width: 350.0,
                    height: 250.0,
                    left: 0,
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
                    "Add location",
                    null,
                    Icons.location_on_outlined,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
