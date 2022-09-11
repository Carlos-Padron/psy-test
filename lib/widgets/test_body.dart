import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:provider/provider.dart';
import 'package:test_psi/models/QuestionAnswers.dart';
import 'package:test_psi/providers/data_provider.dart';
import 'package:test_psi/providers/question_provider.dart';
import 'package:test_psi/theme/app_theme.dart';

class TestBody extends StatelessWidget {
  TestBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionProviver = Provider.of<QuestionProvider>(context);
    final dataProvider = Provider.of<DataProvider>(context);

    final deviceWidth = MediaQuery.of(context).size.width;

    final progress = deviceWidth / questionProviver.questionArray.length;

    if (questionProviver.questionArray.length == 0) {
      return const Center(
        child: Text("No hay preguntas en la encuesta"),
      );
    } else if (questionProviver.testDone) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Gracias por contestar la encuesta",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.text,
              fontFamily: "Medium",
              fontSize: 30,
            ),
          ),
          Icon(
            Boxicons.bx_happy_beaming,
            size: 200,
            color: AppTheme.yellow,
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 40),
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Text(
                          questionProviver
                              .questionArray[questionProviver.currentQuestion]
                              .question,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppTheme.text,
                              fontSize: 30,
                              fontFamily: "Medium"),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: AppTheme.ligthGray),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: 1,
                              items: renderAns(questionProviver
                                  .questionArray[
                                      questionProviver.currentQuestion]
                                  .questionAnswers),
                              borderRadius: BorderRadius.circular(8),
                              style: const TextStyle(
                                  color: AppTheme.text,
                                  fontSize: 20,
                                  fontFamily: "Regular"),
                              elevation: 0,
                              onChanged: (int? value) {
                                //presave results
                                dataProvider.preSaveResults(
                                    questionProviver
                                        .questionArray[
                                            questionProviver.currentQuestion]
                                        .question,
                                    value ?? 0,
                                    questionProviver
                                        .questionArray[
                                            questionProviver.currentQuestion]
                                        .questionAnswers[(value ?? 1) - 1]
                                        .answer);

                                if (questionProviver.currentQuestion + 1 ==
                                    questionProviver.questionArray.length) {
                                  dataProvider.save();
                                }

                                //shows new questions
                                questionProviver.showNextQuestion();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Icon(
            Boxicons.bx_heart_circle,
            size: 200,
            color: AppTheme.red,
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  color: AppTheme.ligthGray,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 40,
                  width: progress * (questionProviver.currentQuestion),
                  color: AppTheme.accentColor,
                ),
              )
            ],
          )
        ],
      );
    }
  }

  List<DropdownMenuItem<int>> renderAns(List<QuestionAnswers> answers) {
    List<DropdownMenuItem<int>> arr = [];

    for (var ans in answers) {
      arr.add(DropdownMenuItem(value: ans.value, child: Text(ans.answer)));
    }

    //print(arr);

    return arr;
  }
}
