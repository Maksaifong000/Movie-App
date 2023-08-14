import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secon_p_getx/controller/trending_controller.dart';
import 'package:secon_p_getx/view/component/bottomNavigator.dart';
import 'package:secon_p_getx/view/component/search_icon.dart';

import '../model/response_json_trending.dart';
import 'component/image_rectangle.dart';
import 'component/image_rectangle_loading.dart';

class SeeAllScreen extends StatelessWidget {
  SeeAllScreen({super.key, required this.title});
  var title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 25,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  Expanded(child: Container()),
                  const SearchIcon()
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    title.toString(),
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 1500,
                  child: FutureBuilder<ResponseJsonTrending>(
                      future: title == "Trending Now"
                          ? TrendingController.fetchTrendingData()
                          : TrendingController.fetchTrendingData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<ResponseJsonTrending> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            return GridView.builder(
                              itemCount: snapshot.data!.results.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ImageRectangle(
                                      urlImage: snapshot
                                          .data!.results[index].posterPath, width: 140, height: 180,),
                                );
                              }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            );
                          }
                        }return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigator(),
    );
  }
}
