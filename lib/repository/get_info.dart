import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:valyuta/model/valyuta_model.dart';

class GetInformationRepository {
  getInformation({required String name}) async {
    try {
      Response response =
          await http.get(Uri.parse('https://nbu.uz/uz/exchange-rates/json/'));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<MyCurrens> categories =
            (jsonData as List?)?.map((e) => MyCurrens.fromJson(e)).toList() ??
                [];
        return categories;
      } else {
        throw Exception();
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw Exception(e);
    }
  }
}
