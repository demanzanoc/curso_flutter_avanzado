import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import '../../model/user_model.dart';

class ProfilePlacesList extends StatelessWidget {
  UserBloc userBloc;
  UserModel userModel;

  ProfilePlacesList({this.userModel});

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Container(
        margin: EdgeInsets.only(
          top: 10.0, left: 20.0, right: 20.0, bottom: 10.0,
        ),
        child: StreamBuilder(
          stream: userBloc.myPlacesListStream(userModel.id),
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
              case ConnectionState.done:
                return Column(
                  children: userBloc.buildMyPlaces(snapshot.data.docs)
                );
              case ConnectionState.none:
              case ConnectionState.waiting:
              default:
                return CircularProgressIndicator();
            }
          },
        )

      /*Column(
        children: <Widget>[
          ProfilePlace(
            place: place,
          ),
          ProfilePlace(
            place: place2,
          ),
        ],
      ),*/
    );
  }
}
