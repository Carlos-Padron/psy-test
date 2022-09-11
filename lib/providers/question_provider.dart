//Core
import 'package:flutter/material.dart';
import 'dart:convert';

//Dependencies
import 'package:flutter/services.dart';
import 'package:test_psi/models/Questions.dart';

class QuestionProvider extends ChangeNotifier {
  //question Array
  List<Questions> _questionArray = [];
  int _currentQuestion = 0;

  //Flags
  bool _dataReceived = false;
  bool _loadingData = true;
  bool _error = false;
  String _errorMessage = "";
  bool _testDone = false;

//Constructor
  //QuestionProvider() {}

  //Getters
  get questionArray => _questionArray;
  get currentQuestion => _currentQuestion;
  get dataReceived => _dataReceived;
  get loadingData => _loadingData;
  get error => _error;
  get errorMessage => _errorMessage;
  bool get testDone => _testDone;

  //Reads json file to display questions
  getQuestion() async {
    try {
      String jsonString =
          await rootBundle.loadString("assets/json/questions.json");

      dynamic data = json.decode(jsonString);

      for (var questionJson in data) {
        Questions question = Questions.fromJson(questionJson);
        _questionArray.add(question);
      }

      _currentQuestion = 0; //_questionArray.length > 0 ? 1 : 0;

      _loadingData = false;
      _dataReceived = true;
    } catch (e) {
      _error = true;
      _loadingData = false;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }

  showNextQuestion() {
    if (_currentQuestion + 1 == _questionArray.length) {
      _testDone = true;
    } else {
      _currentQuestion++;
    }

    notifyListeners();
  }

  restValues() {
    _questionArray = [];
    _currentQuestion = 0;

    //Flags
    _dataReceived = false;
    _loadingData = true;
    _error = false;
    _errorMessage = "";
    _testDone = false;
  }
}
