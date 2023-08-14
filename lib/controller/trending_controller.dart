import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/response_json_trending.dart';

class TrendingController extends GetxController {

  @override
  void onInit() {
    fetchTrendingData();
    // TODO: implement onInit
    super.onInit();
  }

  static Future<ResponseJsonTrending> fetchTrendingData() async {
    const uri = "https://api.themoviedb.org/3/trending/all/day";
    final url = Uri.parse(uri);
    var headers = {
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYTcwYTJlNDAzMDM4MGZmN2JiMmY3ZjVjNTVlNTdlZSIsInN1YiI6IjY0YTNjMTA4OGUyMGM1MDBhZTEzOTU5MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KytwINRnvMhGDWjzqSedQQV44jC2OnNui7d9s2UBYLI"
    };
    final response = await http.get(url, headers: headers);
    return Future.value(ResponseJsonTrending.fromJson(jsonDecode(response.body)));
  }
}