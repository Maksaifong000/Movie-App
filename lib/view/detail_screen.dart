import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secon_p_getx/controller/detail_screen_controller.dart';
import 'package:secon_p_getx/model/response_json_detail_screen.dart';
import 'package:secon_p_getx/model/response_json_movie_credit_people.dart';
import 'package:secon_p_getx/view/component/image_circle.dart';
import 'package:secon_p_getx/view/component/image_rectangle.dart';
import 'package:secon_p_getx/view/component/rating_star_screen.dart';
import 'package:secon_p_getx/view/trending_screen.dart';

import '../controller/trending_controller.dart';
import '../model/response_json_trending.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(
      {super.key,
      required this.movieId,
      required this.bgImage,
      required this.ptImage});

  var ptImage;
  var bgImage;
  var movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.95,
              child: FutureBuilder<ResponseJsonDetailScreen>(
                  future: DetailScreenController.fetchDetailScreenDataById(),
                  builder: (BuildContext context,
                      AsyncSnapshot<ResponseJsonDetailScreen> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ImageRectangle(
                                    urlImage: snapshot.data!.backdropPath,
                                    width: 700,
                                    height: 230),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_ios_new,
                                            color: Colors.white,
                                            size: 25,
                                          )),
                                      Expanded(child: Container()),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.more_horiz,
                                            color: Colors.white,
                                            size: 25,
                                          ))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 150, left: 20),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ImageRectangle(
                                              urlImage:
                                                  snapshot.data!.posterPath,
                                              width: 140,
                                              height: 180),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child:
                                                RatingStarScreen(rateVote: 10),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 80),
                                        child: Text(
                                          snapshot.data!.title,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(snapshot.data!.status)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.deepPurpleAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child:
                                          Text("${snapshot.data!.runtime}mn")),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Overview",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${snapshot.data?.overview}",
                                      style: const TextStyle(
                                          color: Colors.white24,
                                          letterSpacing: 1),
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cast",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                SizedBox(
                                    height: 100,
                                    child: FutureBuilder<ResponseJsonMovieCreditPeople>(
                                      future: DetailScreenController.fetchDetailScreenDataMovieCreditById(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<ResponseJsonMovieCreditPeople> snapshot){
                                        if(snapshot.connectionState == ConnectionState.waiting){
                                          print('wating');
                                            return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else if( snapshot.connectionState == ConnectionState.done){
                                          print('Done');
                                          if(snapshot.hasError){
                                            print('error');
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          } else if(snapshot.hasData){
                                            print('has');
                                            return ListView.builder(
                                              itemCount: snapshot.data!.cast.length,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (BuildContext context, int index) {
                                                return ImageCircle(
                                                    urlImage:
                                                    snapshot.data!.cast[index].profilePath,
                                                    width: 50.0,
                                                    height: 50.0);
                                              },
                                            );
                                          }
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    )
                                ),
                              ],
                            )
                          ],
                        );
                      }
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          )

          //detailData()
        ],
      ),
    );
  }
}
