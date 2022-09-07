class QuestionAnswers {
  int _value = 0;
  String _answer = "";

  QuestionAnswers({required int value, required String answer}) {
    if (value != null) {
      this._value = value;
    }
    if (answer != null) {
      this._answer = answer;
    }
  }

  int get value => _value;
  String get answer => _answer;

  QuestionAnswers.fromJson(Map<String, dynamic> json) {
    _value = json['value'];
    _answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['value'] = this._value;
    data['answer'] = this._answer;
    return data;
  }
}
