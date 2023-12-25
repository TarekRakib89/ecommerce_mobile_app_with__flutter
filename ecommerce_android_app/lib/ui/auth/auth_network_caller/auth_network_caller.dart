import 'dart:convert';

import 'package:ecommerce_android_app/constant/global_variables.dart';
import 'package:ecommerce_android_app/ui/models/user.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<Response> postRequestRegistartion(User user) async {
    Response res = await post(
      Uri.parse("$uri/api/register"),
      body: user.toJson(),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return res;
  }

  Future<Response> postRequestLogin({Map<String, String>? body}) async {
    Response res = await post(
      Uri.parse("$uri/api/login"),
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return res;
  }
}
