import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:re_exam/Screen/model/covid_model.dart';
class Api_helper {

  static final Api_helper api_helper = Api_helper._();

  Api_helper._();

  Future<List<Covid19>> getApi()
  async {
    String like ="https://corona.lmao.ninja/v2/countries";
    var responce = await http.get(Uri.parse(like));
    List json = jsonDecode(responce.body);
    print("============ $json =================");
    List<Covid19> datalist =
    json.map((e) => Covid19.fromJson(e)).toList();
    return datalist;
  }
}