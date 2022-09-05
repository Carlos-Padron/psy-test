//Core
import 'package:flutter/material.dart';
import 'dart:convert';

//Dependencies
import 'package:flutter/services.dart';
import 'package:test_psi/models/Questions.dart';

class QuestionProvider extends ChangeNotifier {
  List<Questions> questionArray = [];

//Constructor
  QuestionProvider() {}

  //Reads json file to display questions
  getQuestion() async {
    String jsonString =
        await rootBundle.loadString("assets/json/question.json");

    dynamic data = json.decode(jsonString);

    for (var questionJson in data) {
      Questions question = Questions.fromJson(questionJson);
      questionArray.add(question);
    }

    notifyListeners();
  }
}
