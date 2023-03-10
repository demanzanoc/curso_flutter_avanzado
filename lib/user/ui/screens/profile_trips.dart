import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/user/bloc/bloc_user.dart';
import 'package:platzi_trips_app/user/model/user_model.dart';
import 'package:platzi_trips_app/user/ui/screens/profile_header.dart';
import '../widgets/profile_background.dart';
import '../widgets/profile_places_list.dart';

class ProfileTrips extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.done:
            return showProfileData(snapshot);
          case ConnectionState.none:
          case ConnectionState.waiting:
          default:
            return CircularProgressIndicator();
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    ListView listView;
    if (!snapshot.hasData || snapshot.hasError) {
      listView = createListView(null);
    } else {
      listView = createListView(
        UserModel(
            id: snapshot.data.uid,
            name: snapshot.data.displayName,
            email: snapshot.data.email,
            photoUrl: snapshot.data.photoURL),
      );
    }
    return Stack(children: [ProfileBackground(), listView]);
  }

  ListView createListView(UserModel userModel) {
    return userModel == null ? ListView(
            children: [Text("Usuario no logueado")],
          ) : ListView(
            children: [
              ProfileHeader(userModel: userModel),
              ProfilePlacesList(userModel: userModel),
            ],
          );
  }
}
