import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:vacancy/model/vacancy_model.dart';

class VacancyController extends ChangeNotifier {
  List<VacancyModel> listVacancies = [];
  bool isLoading = false;
  bool showError = false;

  fetchVacancies() async {
    isLoading = true;
    showError = false;
    notifyListeners();
    try {
      final response = await http.get(
        Uri.parse("https://www.unhcrjo.org/jobs/api"),
      );
      isLoading = false;
      notifyListeners();
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        for (Map i in jsonBody) {
          listVacancies.add(VacancyModel.fromJson(json: i));
        }
        showError = false;
      } else {
        showError = true;
      }
      notifyListeners();
    } catch (error) {
      isLoading = false;
      showError = true;
      notifyListeners();
    }
  }
}
