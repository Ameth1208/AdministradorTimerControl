// ignore_for_file: unnecessary_type_check

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

const localStorage = 'localStorage';

class LocalStorage {
  Future<Box> onBox() async {
    final Box box = await Hive.openBox('mydata');
    return box;
  }

  LocalStorage();

  /// elimina un estado en específico
  Future<void> delete() async {
    final box = await onBox();
    return box.delete(localStorage);
  }

  /// compruebe que existe un estado con la clave proporcionada en el
  /// almacenamiento y devolverlo como un mapa JSON
  Future<Map<String, dynamic>?> get() async {
    final box = await onBox();
    final dataAsString = box.get(localStorage);

    // ignore: unnecessary_null_comparison
    if (dataAsString != null) {
      return jsonDecode(dataAsString);
    }
    return null;
  }

  /// almacenar datos de forma persistente
  Future<void> save(Map<String, dynamic> json) async {
    final box = await onBox();
    return box.put(
      localStorage,
      jsonEncode(json),
    );
  }
}
