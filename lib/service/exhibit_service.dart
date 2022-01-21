import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:testtask/core/utils/api_constant.dart';
import 'package:testtask/model/exhibit_model.dart';

class ExhibitService {
  Future<List<Exhibit>> getExhibitList() async {
    final response = await http.get(
      Uri.parse(
        ApiUrls.exhibitList,
      ),
    );
    if (response.statusCode == 200) {
      log('SUCCES ExhibitService - ${response.statusCode}');
      final result = json.decode(response.body);
      Iterable list = result;
      return list.map((json) => Exhibit.fromJson(json)).toList();
    } else {
      log('FAIL ExhibitService - ${response.statusCode}');
      return [];
    }
  }
}
