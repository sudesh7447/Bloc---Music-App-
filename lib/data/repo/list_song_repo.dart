import 'package:http/http.dart' as http;
import 'package:music_app_work/res/string.dart';
import 'dart:convert';

import '../ListUrl_model.dart';

abstract class TrackRepository {
  Future<List<TrackList>?> getTracks();
}

class TrackRepositoryImpl implements TrackRepository {
  @override
  Future<List<TrackList>?> getTracks() async {
    var response = await http.get(Uri.parse(ApiString.Listurl));
    print(response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<TrackList>? trackList = Body.fromJson(data).trackList;

      return trackList;
    } else {
      throw Exception();
    }
  }
}
