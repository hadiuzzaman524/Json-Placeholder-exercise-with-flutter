import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchDataFromInternet {

  Future<void> fetchData() async {
    const String dataUrl = "https://jsonplaceholder.typicode.com/posts";
    try {
      final response = await http.get(Uri.parse(dataUrl));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Ok");
          print(response.body);
        }
      } else {
        if (kDebugMode) {
          print("Status error ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error");
      }
    }
  }
}
