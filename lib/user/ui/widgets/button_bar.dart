import 'dart:io';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc userBloc;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            CircleButton(
              () => {},
              true,
              Icons.vpn_key,
              20.0,
              Color.fromRGBO(255, 255, 255, 0.6),
            ),
            CircleButton(
              () {
                _imagePicker
                    .pickImage(source: ImageSource.gallery)
                    .then((XFile image) {
                  String path =
                      image != null ? image.path : "assets/img/beach_palm.jpeg";
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AddPlaceScreen(path),
                    ),
                  );
                }).catchError((onError) => print(onError));
              },
              false,
              Icons.add,
              40.0,
              Color.fromRGBO(255, 255, 255, 1),
            ),
            CircleButton(
              () => {userBloc.signOut()},
              true,
              Icons.exit_to_app,
              20.0,
              Color.fromRGBO(255, 255, 255, 0.6),
            ),
          ],
        ));
  }

  String getImageFromGallery() {
    String path = "assets/img/beach_palm.jpeg";
    _imagePicker.pickImage(source: ImageSource.gallery).then((XFile image) {
      path = image != null ? image.path : path;
    }).catchError((onError) => print(onError));
    return path;
  }
}
