import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as httpOperations;

class ApiUtility {
  Future<httpOperations.Response> get(String url) async {
    var headers = Map<String, String>();
    var authToken = GlobalConfiguration().getString("auth-key");
    headers.putIfAbsent("X-Auth-Token", () => authToken);

    return httpOperations.get(url, headers: headers);
  }
}
