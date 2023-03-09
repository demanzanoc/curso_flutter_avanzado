import 'package:flutter/material.dart';
import 'profile_place.dart';
import '../../../place/model/place.dart';

class ProfilePlacesList extends StatelessWidget {
  Place place = Place(
    id: '1',
    name: 'Knuckles Mountains Range',
    description: 'Hiking. Water fall hunting. Natural bath',
    urlImage:
        'https://astelus.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada.jpg',
    likes: 3,
  );

  Place place2 = Place(
    id: '1',
    name: 'Mountains',
    description: 'Hiking. Water fall hunting. Natural bath',
    urlImage:
        'https://thumbs.dreamstime.com/b/paisajes-de-yosemite-46208063.jpg',
    likes: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          ProfilePlace(
            place: place,
          ),
          ProfilePlace(
            place: place2,
          ),
        ],
      ),
    );
  }
}
