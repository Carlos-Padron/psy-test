//Core
import 'dart:io';
import 'dart:convert';

//Models
import 'package:test_psi/models/Answers.dart';

//Dependencies
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';

class DataProvider {
  Future getAgenda() async {
    try {
      String fileName = 'Agenda.json';
      var dir = await getTemporaryDirectory();
      File file = File('${dir.path}/$fileName');

      //Read from file
      if (file.existsSync()) {
        String readJson = file.readAsStringSync();

        dynamic jsonData = json.decode(readJson);

        List<Answers> agenda = [];

        for (var elem in jsonData) {
          // var evento = Answers.fromJson(elem);
          // agenda.add(evento);
        }

        return agenda;
      } else {
        //Create file
        print('call to api');

        print('respondio url primaria');
        List<Answers> agenda = [];

        var jsonResponse = json.decode("");

        for (var elem in jsonResponse) {
          //var evento = Answers.fromJson(elem);
          //agenda.add(evento);
        }

        file.writeAsStringSync(json.encode(jsonResponse));

        return agenda;
      }
    } catch (e) {
      return 'Ocurrió un error al obtener la información.';
    }
  }
}
