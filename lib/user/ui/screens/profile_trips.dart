import 'package:flutter/material.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_header.dart';
import '../widgets/profile_background.dart';
import '../widgets/profile_places_list.dart';

class ProfileTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfilePlacesList(),
          ],
        ),
      ],
    );
  }
}
