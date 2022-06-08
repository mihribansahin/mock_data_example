import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List _items = [];
  List stories_list = [];
  List product_list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/test.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
      stories_list = data['items'][0]['stories'];
      product_list = data['items'][0]['products'];
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

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
          child: FutureBuilder<void>(
              future: readJson(),
              builder: (context, snapshot) {
                if (_items .length > 4) {
                  return Column(
                    children: [
                      MyHeaderWidget(
                          imageUrl: _items[0]['photoUrl'],
                          userName: _items[0]["name"],
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
                                    itemCount: stories_list.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          var storyId = (_items[0]['stories']
                                              [index]['story_id']);
                                          print("clicked story id :${storyId}");
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: Text(
                                                      "Story id: $storyId"),
                                                  content: Container(),
                                                );
                                              });
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: MyAvatar(
                                              headerAvatar: false,
                                              bottomMenuAvatar: false,
                                              imageUrl: _items[0]['stories']
                                                  [index]['story_pp_url'],
                                            )),
                                      );
                                    }),
                              ),
                              Divider(),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: product_list.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ProductCard(
                                      avatarImageUrl: _items[0]['products']
                                          [index]['product_avatar_photo'],
                                      productImageUrl: _items[0]['products']
                                          [index]['product_photo'],
                                      title: _items[0]['products'][index]
                                          ['product_title'],
                                      subTitle: _items[0]['products'][index]
                                          ['product_subtitle'],
                                      distance: _items[0]['products'][index]
                                          ['product_distance'],
                                      favLastUsername: _items[0]['products']
                                          [index]['product_last_fav_username'],
                                      favUserCount: _items[0]['products'][index]
                                          ['product_fav_count'],
                                    );
                                  })
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(child: const CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
