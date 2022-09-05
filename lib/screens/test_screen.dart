import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:test_psi/theme/app_theme.dart';
import 'package:test_psi/widgets/custom_header.dart';

class TestScreen extends StatefulWidget {
  TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String selectedValue = "1";

  final List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "1", child: Text("1")),
    const DropdownMenuItem(value: "2", child: Text("2")),
    const DropdownMenuItem(value: "3", child: Text("3")),
    const DropdownMenuItem(value: "4", child: Text("4")),
    const DropdownMenuItem(value: "5", child: Text("5")),
    const DropdownMenuItem(value: "6", child: Text("6")),
    const DropdownMenuItem(value: "7", child: Text("7")),
  ];

  @override
  Widget build(BuildContext context) {
    final headerHeight = MediaQuery.of(context).padding.top + 56;
    final bottomSafeArea = MediaQuery.of(context).padding.bottom;
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          const CustomHeader(),
          SizedBox(
            height: deviceSize.height - headerHeight - bottomSafeArea,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        child: SizedBox(
                          child: Column(
                            children: [
                              const Text(
                                "¿Cómo te sientes el día de hoy?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
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
                                    value: selectedValue,
                                    items: menuItems,
                                    borderRadius: BorderRadius.circular(8),
                                    style: const TextStyle(
                                        color: AppTheme.text,
                                        fontSize: 20,
                                        fontFamily: "Regular"),
                                    elevation: 0,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValue = newValue!;
                                      });
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
                        width: 80,
                        color: AppTheme.accentColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
