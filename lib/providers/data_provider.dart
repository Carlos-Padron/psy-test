//Core
import 'dart:io';
import 'dart:convert';

//Models
import 'package:flutter/material.dart';
import 'package:test_psi/models/Answers.dart';

//Dependencies
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

class DataProvider extends ChangeNotifier {
  List<Map> respuestas = [];

  Future save() async {
    try {
      String fileName = 'results.json';
      var dir = await getTemporaryDirectory();
      File file = File('${dir.path}/$fileName');

      //Read from file
      if (file.existsSync()) {
        file.writeAsStringSync(json.encode(respuestas));

        String readJson = file.readAsStringSync();

        //dynamic jsonData = json.decode(readJson);

        print(readJson);
      } else {
        file.writeAsStringSync(json.encode(respuestas));
      }
    } catch (e) {
      return 'Ocurrió un error al obtener la información.';
    }
  }

  preSaveResults(String question, int value, String answer) {
    respuestas.add({
      "question": question,
      "value": value,
      "answer": answer,
    });

    print(respuestas);
  }

  Future readFile() async {
    String fileName = 'results.json';
    var dir = await getTemporaryDirectory();
    File file = File('${dir.path}/$fileName');

    if (file.existsSync()) {
      print("existe");

      file.writeAsStringSync(json.encode(respuestas));

      String readJson = file.readAsStringSync();

      //dynamic jsonData = json.decode(readJson);

      print(readJson);
    } else {
      print("No existe el archivo");
    }
  }
}
