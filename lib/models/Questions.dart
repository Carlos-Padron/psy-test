import 'QuestionAnswers.dart';

class Questions {
  int _id = 0;
  String _question = "";
  List<QuestionAnswers> _questionAnswers = [];

  Questions(
      {required id,
      required String question,
      required List<QuestionAnswers> questionAnswers}) {
    if (id != null) {
      this._id = id;
    }
    if (question != null) {
      this._question = question;
    }
    if (questionAnswers != null) {
      this._questionAnswers = questionAnswers;
    }
  }

  int get id => _id;
  String get question => _question;
  List<QuestionAnswers> get questionAnswers => _questionAnswers;

  Questions.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _question = json['question'];
    if (json['QuestionAnswers'] != null) {
      _questionAnswers = <QuestionAnswers>[];
      json['QuestionAnswers'].forEach((v) {
        _questionAnswers.add(new QuestionAnswers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['question'] = this._question;
    if (this._questionAnswers != null) {
      data['QuestionAnswers'] =
          this._questionAnswers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
