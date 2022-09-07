import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:provider/provider.dart';
import 'package:test_psi/providers/question_provider.dart';
import 'package:test_psi/theme/app_theme.dart';
import 'package:test_psi/widgets/custom_header.dart';

class SelectTestScreen extends StatefulWidget {
  const SelectTestScreen({Key? key}) : super(key: key);

  @override
  State<SelectTestScreen> createState() => _SelectTestScreenState();
}

class _SelectTestScreenState extends State<SelectTestScreen> {
  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionProvider>(context);

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            const CustomHeader(),
            SingleChildScrollView(
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/answerTest");
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      //margin: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                      height: 120,
                      width: double.infinity,
                      color: AppTheme.yellow,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -80,
                            left: -80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Container(
                                height: 160,
                                width: 160,
                                color: const Color.fromARGB(255, 255, 202, 89),
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Encuesta de snacks",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: "Medium"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column loTestsToDo() {
    return Column(
      children: [
        const SizedBox(height: 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Container(
            width: double.infinity,
            height: 500,
            child: Column(
              children: const [
                Icon(
                  Boxicons.bx_happy_beaming,
                  size: 100,
                  color: Colors.yellow,
                ),
                Text(
                  "¡No tienes encuestas por responder!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppTheme.accentColor,
                      fontSize: 28,
                      fontFamily: "Medium"),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
