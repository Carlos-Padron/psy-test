import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';
import 'package:test_psi/theme/app_theme.dart';
import 'package:test_psi/widgets/custom_header.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class ReviewAnswersScreen extends StatefulWidget {
  const ReviewAnswersScreen({Key? key}) : super(key: key);

  @override
  State<ReviewAnswersScreen> createState() => _ReviewAnswersScreenState();
}

class _ReviewAnswersScreenState extends State<ReviewAnswersScreen> {
  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.readFile();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    final safeArea = MediaQuery.of(context).padding.top;
    final screen = MediaQuery.of(context).size.height;

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
            Container(
              height: screen - (56 + safeArea),
              width: double.infinity,
              child: ListView(children: renderCards(dataProvider.resultados)),
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
                color: res["color"],
                child: Row(
                  children: [
                    Container(
                      height: double.infinity,
                      width: 80, //lightBlue, blue, indigo
                      color: res["accent"],
                      child: Center(
                          child: Text(
                        res["value"].toString(),
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
                          res["area"],
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

      return arr;
    }
  }
}
