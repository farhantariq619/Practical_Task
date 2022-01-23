import 'package:http/http.dart' as http;
import 'package:practical_task/model/last_fm_model.dart';
import 'package:practical_task/network/api_key.dart';
import 'package:practical_task/network/api_url.dart';

class SearchAlbumViewModel {
  Future<LastFmModel?> getSearchAlbum({
    required String album,
  }) async {
    try {
      String completeUrl = ApiUrl.searchAlbumUrl +
          "method=album.search&album=$album&api_key=${ApiKey.lastFmApiKey}&format=json";
      final response = await http.get(Uri.parse(completeUrl));
      if (response.statusCode == 200) {
        print('response.body: ${response.body}');
        return LastFmModel.fromJson(response.body);
      }
    } catch (e) {
      throw Exception('Get Search Album Exception: $e');
    }
  }
}
