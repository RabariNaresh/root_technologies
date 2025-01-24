import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {
  Future<Map<String, dynamic>> fetchApiData(String categoryId) async {
    Uri uri = Uri.parse(
        "https://shoproute.roottechnologies.co.in/api/v1/store-categories/$categoryId/products");
    Response response = await http.get(uri);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception("data is failed!!!");
      }
    } catch (e) {
      throw Exception("failed to fetch data!!!");
    }
  }

  Future<List> fetchApiDataOfCarousel() async {
    Uri uri =
        Uri.parse("https://shoproute.roottechnologies.co.in/api/v1/carousels");
    Response response = await http.get(uri);

    try {
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception("data is failed!!!");
      }
    } catch (e) {
      throw Exception("failed to fetch data!!!");
    }
  }

  Future<Map<String, dynamic>> fetchApiDataOfCategories() async {
    Uri uri = Uri.parse(
        "https://shoproute.roottechnologies.co.in/api/v1/store-categories");
    Response response = await http.get(uri);

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception("data is failed!!!");
      }
    } catch (e) {
      throw Exception("failed to fetch data!!!");
    }
  }
}
