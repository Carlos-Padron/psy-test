import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:provider/provider.dart';
import 'package:test_psi/theme/app_theme.dart';
import 'package:test_psi/widgets/custom_header.dart';

import '../providers/data_provider.dart';

class ReviewAnswersScreen extends StatelessWidget {
  const ReviewAnswersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    //dataProvider.readFile();

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
              child: Column(children: renderCards(dataProvider.resultados)),
            ),
          ],
        ),
      ),
    );
  }

  renderCards(results) {
    if (results.length == 0) {
      return const [
        SizedBox(
          height: 80,
        ),
        Icon(
          Boxicons.bx_happy_beaming,
          size: 100,
          color: Colors.yellow,
        ),
        Text(
          "¡No tienes encuestas por responder!",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppTheme.accentColor, fontSize: 28, fontFamily: "Medium"),
        )
      ];
    } else {
      List<Widget> arr = [];

      for (var res in results) {
        arr.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 120,
                width: double.infinity,
                color: res.accent,
                child: Row(
                  children: [
                    Container(
                      height: double.infinity,
                      width: 80, //lightBlue, blue, indigo
                      color: res.color,
                      child: Center(
                          child: Text(
                        res.value,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Medium",
                            fontSize: 30),
                      )),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          res.area,
                          style: const TextStyle(
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
          ),
        );
      }
    }
  }
}
