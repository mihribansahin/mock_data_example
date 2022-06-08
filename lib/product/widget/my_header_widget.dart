import 'package:flutter/material.dart';
import 'package:mock_data_example/product/widget/widget_item/my_avatar.dart';
import 'package:mock_data_example/product/widget/widget_item/my_badge.dart';

class MyHeaderWidget extends StatelessWidget {
  String imageUrl = "";
  String userName = "";
  String welcomeMessage = "";

  MyHeaderWidget(
      {Key? key,
      required this.imageUrl,
      required this.userName,
      required this.welcomeMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      horizontalTitleGap: 0,
      leading: MyAvatar(
        headerAvatar: true,
        bottomMenuAvatar: false,
        imageUrl: imageUrl,
      ),
      title: Text(
        welcomeMessage,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(
        userName,
        style:
            TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w500),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              print("notification");
            },
            child: Image.asset(
              "assets/images/bell-ring.png",
              height: 20,
              color: Colors.grey.shade900,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              print("e-mail");
            },
            child: MyBadge(
              child: Image.asset(
                "assets/images/email.png",
                height: 20,
                color: Colors.grey.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
