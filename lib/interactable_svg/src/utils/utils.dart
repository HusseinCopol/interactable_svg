import 'package:http/http.dart' as http;

Future<http.Response> httpGet(String uri, String name,
    {Map<String, String>? headers}) async {
  var url = Uri.https(uri, name);

  var response = await http.get(url);

  if (response.statusCode != 200) {
    throw Exception(
      'Could not get network asset',
    );
  }
  return response;
}
