import 'package:flutter/material.dart';
import 'package:platzi_trips_app/user/model/user_model.dart';
import 'profile_place.dart';
import '../../../place/model/place.dart';

class ProfilePlacesList extends StatelessWidget {
  Place place = Place(
    '1',
    'Knuckles Mountains Range',
    'Hiking. Water fall hunting. Natural bath',
    'https://astelus.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada.jpg',
    3,
    UserModel('', '', '', '', List.empty(), List.empty()),
  );

  Place place2 = Place(
    '1',
    'Mountains',
    'Hiking. Water fall hunting. Natural bath',
    'https://thumbs.dreamstime.com/b/paisajes-de-yosemite-46208063.jpg',
    20,
    UserModel('', '', '', '', List.empty(), List.empty()),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
        ],
      ),
    );
  }
}
