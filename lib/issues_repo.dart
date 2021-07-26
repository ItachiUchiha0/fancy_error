import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> fetchIssueSearch(String text) async {
  final response =
      await http.get(Uri.parse('https://api.github.com/search/issues?q=$text'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON
    Map mapRes = json.decode(response.body);
    return mapRes["items"];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load issues');
  }
}
