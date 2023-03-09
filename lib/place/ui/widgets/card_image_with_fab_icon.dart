import 'package:flutter/material.dart';
import '../../../widgets/floating_action_button_green.dart';

class CardImageWithFabIcon extends StatelessWidget {
  final double height;
  final double width;
  final double left;
  final double top;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;
  final String pathImage;

  CardImageWithFabIcon({
    this.pathImage = "assets/img/beach.jpeg",
    this.width = 250.0,
    this.height = 350.0,
    this.onPressedFabIcon,
    this.iconData,
    this.left = 20.0,
    this.top = 80.0
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(top: top, left: left),
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(pathImage)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black38,
              blurRadius: 15.0,
              offset: Offset(0.0, 7.0)),
        ],
      ),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          iconData: iconData,
          onPressed: onPressedFabIcon,
        )
      ],
    );
  }
}
