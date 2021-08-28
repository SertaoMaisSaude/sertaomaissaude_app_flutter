import 'dart:convert';

import 'package:covid19app/app/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:hive/hive.dart';

///Classe responsavel por inteceptar todos as requests da api.
///
///A classe é importada no [CustomDio] e e setada no singleton do Dio que será utlizado em todo o sistema
class CustomInterceptors extends InterceptorsWrapper {
  ///O [onRequest] é onde será adicionado o token para captação e envio de informações e .
  @override
  onRequest(RequestOptions options) async {
    if (DEBUG) print("REQUEST: ${options.method} PATH: ${options.path}");
    options.headers['Authorization'] = 'Token $TOKEN';
    if (options.extra.containsKey("refresh")) {
      if (options.extra['refresh']) {
        return options;
      } else {
        return getCache(options.uri.toString());
      }
    }
    return options;
  }

  ///O [onResponse] é onde será chamado em todas as requisições 200 ou 201
  @override
  onResponse(Response response) async {
    if (DEBUG)
      print("RESPONSE: ${response.statusCode} PATH: ${response.request.path}");
    await saveCache(response);
    return response;
  }

  ///O [onError] é onde será chamado em qualquer requisição que não for 200 ou 201
  @override
  onError(DioError err) async {
    print("ERROR: ${err.type} PATH: ${err.request.path}");
    if (err.type == DioErrorType.CONNECT_TIMEOUT ||
        err.type == DioErrorType.DEFAULT) {
      final cache = getCache(err.request.uri.toString());
      if (cache != null) {
        return cache;
      }
    }
    return err;
  }

  saveCache(Response response) async {
//    var box = await Hive.openBox('cache');
//    await box.put('${response.request.uri}', jsonEncode(response.data));
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('${response.request.uri}', jsonEncode(response.data));
    saveDate(response.request.uri.toString());
  }

  saveDate(String uri) async {
//    var box = await Hive.openBox('cache');
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('date: $uri', DateTime.now().toString());
  }

  Future<DateTime> getDate(String uri) async {
//    var box = await Hive.openBox('cache');
    final prefs = await SharedPreferences.getInstance();

    DateTime date;
    if (prefs.containsKey('date: $uri')) {
      date = DateTime.parse(prefs.get('date: $uri'));
    }
    return date;
  }

  getCache(String uri) async {
//    var box = await Hive.openBox('cache');
    final prefs = await SharedPreferences.getInstance();

    final date = await getDate(uri);
    if (date != null) {
      final diff = DateTime.now().difference(date).inMinutes;
      if (prefs.containsKey(uri) && diff < 60) {
        var res = jsonDecode(prefs.getString(uri));
        return Response(data: res, statusCode: 200);
      } else {
        prefs.clear();
      }
    }
    return null;
  }
}
