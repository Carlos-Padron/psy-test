import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_psi/providers/data_provider.dart';
import 'package:test_psi/providers/question_provider.dart';
import 'package:test_psi/theme/app_theme.dart';

class CustomHeader extends StatelessWidget {
  final String? name;

  const CustomHeader({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeArea = MediaQuery.of(context).padding.top;

    final questionProvider = Provider.of<QuestionProvider>(context);
    final dataProvider = Provider.of<DataProvider>(context);

    return Container(
      height: 56 + safeArea,
      width: double.infinity,
      color: AppTheme.primaryColor,
      child: Column(
        children: [
          SizedBox(height: safeArea),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  name ?? "",
                  style: const TextStyle(
                      color: Colors.white, fontSize: 25, fontFamily: "Medium"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/login");
                    questionProvider.restValues();
                    dataProvider.resetValues();
                  },
                  child: const Icon(
                    Icons.logout_rounded,
                    color: AppTheme.accentColor,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
