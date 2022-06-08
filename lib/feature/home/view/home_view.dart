import 'package:flutter/material.dart';
import 'package:mock_data_example/product/widget/my_header_widget.dart';
import 'package:mock_data_example/product/widget/widget_item/my_avatar.dart';
import 'package:mock_data_example/feature/temp_pages/test_pages.dart';
import 'package:mock_data_example/product/widget/widget_item/my_badge.dart';

import '../../../product/widget/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);

    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: EdgeInsets.only(
              top: 5,
              left: screenWidth > 600 ? screenWidth * .1 : 5,
              right: screenWidth > 600 ? screenWidth * .1 : 5),
          child: Column(
            children: [
              MyHeaderWidget(
                  imageUrl:
                      'https://pbs.twimg.com/profile_images/1527007156289028096/xs3xTEXm_400x400.jpg',
                  userName: "Mihriban Şahin",
                  welcomeMessage: "Günaydın"),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        child: ListView.builder(
                            itemCount: 100,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: MyAvatar(
                                    headerAvatar: false,
                                    bottomMenuAvatar: false,
                                    imageUrl:
                                        'https://pbs.twimg.com/profile_images/1527007156289028096/xs3xTEXm_400x400.jpg',
                                  ));
                            }),
                      ),
                      Divider(),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ProductCard(
                              avatarImageUrl:
                                  'https://pbs.twimg.com/profile_images/1277520494858776577/qfwx1tP8_400x400.jpg',
                              productImageUrl:
                                  "https://st.mngbcn.com/rcs/pics/static/T2/fotos/outfit/S20/27062507_09-99999999_01.jpg?ts=1642675903718&imwidth=630&imdensity=2",
                              title: "ZARA",
                              subTitle: "TerraCity, Antalya",
                              distance: "2km",
                              favLastUsername: "Mihriban Şahin",
                              favUserCount: 21.043,
                            );
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
