import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secon_p_getx/controller/trending_controller.dart';
import 'package:secon_p_getx/model/response_json_trending.dart';
import 'package:secon_p_getx/view/component/image_rectangle.dart';
import 'package:secon_p_getx/view/detail_screen.dart';
import 'package:secon_p_getx/view/see_all_screen.dart';

class TrendingScreen extends StatelessWidget {
  TrendingScreen({super.key});

  var title = "Trending Now".obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              const Text(
                "Trending Now",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  Get.to(SeeAllScreen(title: title));
                },
                child: const Text(
                  "See all",
                  style: TextStyle(color: Colors.white38),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 200,
            child: FutureBuilder<ResponseJsonTrending>(
                future: TrendingController.fetchTrendingData(),
                builder: (BuildContext context,
                    AsyncSnapshot<ResponseJsonTrending> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.results.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(DetailScreen(
                                movieId: snapshot.data!.results[index].id,
                                bgImage:
                                    snapshot.data!.results[index].backdropPath,
                                ptImage:snapshot.data!.results[index].posterPath,
                              ));
                            },
                            child: ImageRectangle(
                                urlImage:
                                    snapshot.data!.results[index].posterPath,
                                width: 140,
                                height: 180),
                          );
                        },
                      );
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
