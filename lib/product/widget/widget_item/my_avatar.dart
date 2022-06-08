import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  
  bool headerAvatar = false;
  bool? bottomMenuAvatar = false;
  String imageUrl = "";
  MyAvatar({Key? key, required this.headerAvatar, required this.imageUrl,this.bottomMenuAvatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return headerAvatar
        ? Container(
            width: bottomMenuAvatar! ? 30:  70,
            height: bottomMenuAvatar! ? 30:70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.contain),
            ),
          )
        : DashedCircle(
            dashes: 40,
            strokeWidth: 1,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.contain),
                ),
              ),
            ),
            color: Colors.pink,
          );
  }
}
