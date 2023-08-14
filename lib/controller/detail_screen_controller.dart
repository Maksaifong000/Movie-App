import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:secon_p_getx/model/response_json_detail_screen.dart';
import 'package:secon_p_getx/model/response_json_movie_credit_people.dart';

class DetailScreenController extends GetxController {

  @override
  void onInit() {
    fetchDetailScreenDataById();
    // TODO: implement onInit
    super.onInit();
  }

  static Future<ResponseJsonDetailScreen> fetchDetailScreenDataById() async {
    const uri = "https://api.themoviedb.org/3/movie/614479";
    final url = Uri.parse(uri);
    var headers = {
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYTcwYTJlNDAzMDM4MGZmN2JiMmY3ZjVjNTVlNTdlZSIsInN1YiI6IjY0YTNjMTA4OGUyMGM1MDBhZTEzOTU5MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KytwINRnvMhGDWjzqSedQQV44jC2OnNui7d9s2UBYLI"
    };
    final response = await http.get(url, headers: headers);
    return Future.value(ResponseJsonDetailScreen.fromJson(jsonDecode(response.body)));
  }

  static Future<ResponseJsonMovieCreditPeople> fetchDetailScreenDataMovieCreditById() async {
    const uri = "https://api.themoviedb.org/3/movie/614479/credits";
    final url = Uri.parse(uri);
    var headers = {
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYTcwYTJlNDAzMDM4MGZmN2JiMmY3ZjVjNTVlNTdlZSIsInN1YiI6IjY0YTNjMTA4OGUyMGM1MDBhZTEzOTU5MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KytwINRnvMhGDWjzqSedQQV44jC2OnNui7d9s2UBYLI"
    };
    final response = await http.get(url, headers: headers);
    return Future.value(ResponseJsonMovieCreditPeople.fromJson(jsonDecode(response.body)));
  }
}