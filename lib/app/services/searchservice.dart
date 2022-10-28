import 'package:jobizy/app/module/jobsearch/model/searchrespo.dart';
import 'package:jobizy/app/services/dioservices.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/url.dart';

class SearchService{
  Future<SearchResponse?> searchService(String data) async {
    if (await connectionCheck()) {
      try {
        final response = await DioServices.postFunction(
            url: Url().jobSearch, value: data.tojson());

        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('Login Successful.......................');
          return SearchResponse.fromJson(response.data);
        } else {
          return SearchResponse.fromJson(response.data);
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 400) {
          return SearchResponse(message: 'User already exists');
        }
      } catch (e) {
        return SearchResponse(message: 'Something Went Worng........');
      }
    } else {
      return SearchResponse(message: "Please check the internet connection");
    }
    return null;
  }
}