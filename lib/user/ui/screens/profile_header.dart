import 'package:flutter/material.dart';
import '../widgets/user_info.dart';
import '../widgets/button_bar.dart';
import '../../model/user_model.dart';

class ProfileHeader extends StatelessWidget {
  UserModel userModel;

  ProfileHeader({this.userModel});

  @override
  Widget build(BuildContext context) {
    final title = Text(
      'Profile',
      style: TextStyle(
        fontFamily: 'Lato',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
    );
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[title],
          ),
          UserInfo(user: userModel),
          ButtonsBar()
        ],
      ),
    );
  }

/*Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar la información"),
          ],
        ),
      );
    } else {
      userModel = UserModel(
          id: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoUrl: snapshot.data.photoURL);
      final title = Text(
        'Profile',
        style: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),
      );
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[title],
            ),
            UserInfo(userModel),
            ButtonsBar()
          ],
        ),
      );
    }
  }*/
}
