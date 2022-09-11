import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:test_psi/theme/app_theme.dart';
import 'package:test_psi/widgets/custom_header.dart';

class ReviewAnswersScreen extends StatelessWidget {
  const ReviewAnswersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            const CustomHeader(
              name: "Resultados de Arturo",
            ),
            SingleChildScrollView(
              child: Column(children: [renderCards()]),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 120,
          width: double.infinity,
          color: Colors.blueAccent,
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 80, //lightBlue, blue, indigo
                color: Colors.blue,
              ),
              const Flexible(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "A looooooooooooooooooong text",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
