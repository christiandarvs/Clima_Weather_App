// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {
  final String url;
  NetworkHelper({
    required this.url,
  });

  Future getData() async {
    Response response = await get(Uri.parse(url));
    var responseBody = response.body;
    return jsonDecode(responseBody);
  }
}
