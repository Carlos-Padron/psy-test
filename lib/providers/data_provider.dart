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
  List<Map> _resultados = [];

  get resultados => _resultados;

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
        print("done saving");
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
  }

  Future readFile() async {
    String fileName = 'results.json';
    var dir = await getTemporaryDirectory();
    File file = File('${dir.path}/$fileName');

    //print(file.existsSync());

    if (file.existsSync()) {
      String readJson = file.readAsStringSync();
      //print(readJson);

      dynamic jsonData = json.decode(readJson);
      //print(jsonData);

      gradeResults(jsonData);
    }

    notifyListeners();
  }

  gradeResults(json) {
    //Uso el numero de la pregunta y le resto uno por que los arreglo inician en 0.
    // Para acceder a la pregunta 14 uso el indice 13, 14 - 1 = 13
    //Actitud frente a la madre

    _resultados = [];

    print(json[14 - 1]);
    print(json[14 - 1]["value"]);
    print("=====");

    double actMadre = ((json[14 - 1]["value"] +
            json[29 - 1]["value"] +
            json[44 - 1]["value"] +
            json[59 - 1]["value"]) /
        4);

    double actPadre = ((json[1 - 1]["value"] +
            json[16 - 1]["value"] +
            json[31 - 1]["value"] +
            json[46 - 1]["value"]) /
        4);

    double actUniFam = ((json[12 - 1]["value"] +
            json[27 - 1]["value"] +
            json[42 - 1]["value"] +
            json[57 - 1]["value"]) /
        4);

    double actSexCont = ((json[10 - 1]["value"] +
            json[25 - 1]["value"] +
            json[40 - 1]["value"] +
            json[55 - 1]["value"]) /
        4);

    double actRelHet = ((json[11 - 1]["value"] +
            json[26 - 1]["value"] +
            json[41 - 1]["value"] +
            json[56 - 1]["value"]) /
        4);

    double actAmigos = ((json[8 - 1]["value"] +
            json[23 - 1]["value"] +
            json[38 - 1]["value"] +
            json[53 - 1]["value"]) /
        4);

    double actPerSup = ((json[6 - 1]["value"] +
            json[21 - 1]["value"] +
            json[36 - 1]["value"] +
            json[51 - 1]["value"]) /
        4);

    double actPerSupervi = ((json[4 - 1]["value"] +
            json[19 - 1]["value"] +
            json[34 - 1]["value"] +
            json[48 - 1]["value"]) /
        4);

    double actCompTraEsc = ((json[13 - 1]["value"] +
            json[28 - 1]["value"] +
            json[43 - 1]["value"] +
            json[58 - 1]["value"]) /
        4);

    double temores = ((json[7 - 1]["value"] +
            json[22 - 1]["value"] +
            json[37 - 1]["value"] +
            json[52 - 1]["value"]) /
        4);

    double sentCulp = ((json[15 - 1]["value"] +
            json[30 - 1]["value"] +
            json[45 - 1]["value"] +
            json[60 - 1]["value"]) /
        4);

    double propHab = ((json[2 - 1]["value"] +
            json[17 - 1]["value"] +
            json[32 - 1]["value"] +
            json[47 - 1]["value"]) /
        4);

    double actPasado = ((json[9 - 1]["value"] +
            json[24 - 1]["value"] +
            json[39 - 1]["value"] +
            json[54 - 1]["value"]) /
        4);

    double actFuturo = ((json[5 - 1]["value"] +
            json[20 - 1]["value"] +
            json[35 - 1]["value"] +
            json[50 - 1]["value"]) /
        4);

    double metas = ((json[3 - 1]["value"] +
            json[18 - 1]["value"] +
            json[33 - 1]["value"] +
            json[49 - 1]["value"]) /
        4);

    _resultados.add({
      "area": "Actitud frente a la madre",
      "value": actMadre,
      "color": getColors(actMadre, false),
      "accent": getColors(actMadre, true),
    });

    //Actitud frente al padre
    _resultados.add({
      "area": "Actitud frente a la padre",
      "value": actPadre,
      "color": getColors(actPadre, false),
      "accent": getColors(actPadre, true),
    });

    //Actitud frente a la unidad de la familia
    _resultados.add({
      "area": "Actitud frente a la unidad de la familia",
      "value": actUniFam,
      "color": getColors(actUniFam, false),
      "accent": getColors(actUniFam, true),
    });

    //Actitud hacia el sexo contrario
    _resultados.add({
      "area": "Actitud hacia el sexo contrario",
      "value": actSexCont,
      "color": getColors(actSexCont, false),
      "accent": getColors(actSexCont, true),
    });

    //Actitud hacia las relacinoes heterosexuales
    _resultados.add({
      "area": "Actitud hacia las relaciones heterosexuales",
      "value": actRelHet,
      "color": getColors(actRelHet, false),
      "accent": getColors(actRelHet, true),
    });

    //Actitud hacia los amigos
    _resultados.add({
      "area": "Actitud hacia los amigos",
      "value": actAmigos,
      "color": getColors(actAmigos, false),
      "accent": getColors(actAmigos, true),
    });

    //Actitud hacia las personas superiores en el trabajo o en la escuela
    _resultados.add({
      "area":
          "Actitud hacia las personas superiores en el trabajo o en la escuela",
      "value": actPerSup,
      "color": getColors(actPerSup, false),
      "accent": getColors(actPerSup, true),
    });

    //Actitud hacia las personas supervisadas
    _resultados.add({
      "area": "Actitud hacia las personas supervisadas",
      "value": actPerSupervi,
      "color": getColors(actPerSupervi, false),
      "accent": getColors(actPerSupervi, true),
    });

    //Actitud hacia los compañeros en la escuela y en trabajo
    _resultados.add({
      "area": "Actitud hacia los compañeros en la escuela y en trabajo",
      "value": actCompTraEsc,
      "color": getColors(actCompTraEsc, false),
      "accent": getColors(actCompTraEsc, true),
    });

    //Temores
    _resultados.add({
      "area": "Temores",
      "value": temores,
      "color": getColors(temores, false),
      "accent": getColors(temores, true),
    });

    //Sentimiendos de culpa
    _resultados.add({
      "area": "Sentimientos de culpa",
      "value": sentCulp,
      "color": getColors(sentCulp, false),
      "accent": getColors(sentCulp, true),
    });

    //Actitud hacias las propias habilidades
    _resultados.add({
      "area": "Actitud hacias las propias habilidades",
      "value": propHab,
      "color": getColors(propHab, false),
      "accent": getColors(propHab, true),
    });

    //Actitud hacia el pasado
    _resultados.add({
      "area": "Actitud hacia el pasado",
      "value": actPasado,
      "color": getColors(actPasado, false),
      "accent": getColors(actPasado, true),
    });

    //Actitud hacia el futuro
    _resultados.add({
      "area": "Actitud hacia el futuro",
      "value": actFuturo,
      "color": getColors(actFuturo, false),
      "accent": getColors(actFuturo, true),
    });

    //Metas
    _resultados.add({
      "area": "Metas",
      "value": metas,
      "color": getColors(metas, false),
      "accent": getColors(metas, true),
    });
  }

  //Aqui puedes modificar los colores
  Color getColors(double value, bool accent) {
    if (accent) {
      if (value <= 1) {
        return Colors.red;
      } else if (value <= 2) {
        return Colors.orange;
      } else if (value <= 3) {
        return Colors.yellow;
      } else if (value <= 4) {
        return Colors.green;
      } else if (value <= 5) {
        return Colors.lightBlue;
      } else if (value <= 6) {
        return Colors.blue;
      } else {
        return Colors.indigo;
      }
    } else {
      if (value <= 1) {
        return Colors.redAccent;
      } else if (value <= 2) {
        return Colors.orangeAccent;
      } else if (value <= 3) {
        return Color.fromARGB(255, 219, 219, 0);
      } else if (value <= 4) {
        return Colors.greenAccent;
      } else if (value <= 5) {
        return Colors.lightBlueAccent;
      } else if (value <= 6) {
        return Colors.blueAccent;
      } else {
        return Colors.indigoAccent;
      }
    }
  }

  resetValues() {
    respuestas = [];
  }
}
