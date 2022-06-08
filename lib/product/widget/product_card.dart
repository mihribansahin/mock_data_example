import 'package:flutter/material.dart';
import 'package:mock_data_example/product/widget/widget_item/my_avatar.dart';

class ProductCard extends StatelessWidget {
  String avatarImageUrl = "";
  String productImageUrl = "";

  String title = "";
  String subTitle = "";
  String distance = "";
  String favLastUsername = "";
  double favUserCount = 0.0;

  ProductCard({
    Key? key,
    required this.avatarImageUrl,
    required this.productImageUrl,
    required this.title,
    required this.subTitle,
    required this.distance,
    required this.favLastUsername,
    required this.favUserCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenHeight * .45,
      width: screenWidth * .9,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyAvatar(
                  headerAvatar: false,
                  bottomMenuAvatar: false,
                  imageUrl: avatarImageUrl,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              subTitle,
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 14),
                            ),
                            Spacer(),
                            Text(
                              distance,
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(productImageUrl),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite_rounded,
                      color: Colors.red.shade600,
                    ),
                    RichText(
                      text: TextSpan(
                        text: ' $favLastUsername',
                        style: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ve',
                            style: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: ' ${favUserCount.toString()}',
                            style: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' kişi beğendi',
                            style: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  "assets/images/bookmark.png",
                  height: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
