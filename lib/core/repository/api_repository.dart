import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uplanit_supplier/core/enums/request_type.dart';

import 'api.dart';

class ApiRepository extends Api {
  var client = http.Client();
  @override
  Future<http.Response> request({
    RequestType requestType,
    String path,
    dynamic parameter,
    String token,
  }) {
    switch (requestType) {
      case RequestType.GET:
        return client.get(
          Api.baseUrl + path,
          headers: {
            "Authorization": "bearer $token",
          },
        );
      case RequestType.POST:
        return client.post(
          Api.baseUrl + path,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "bearer $token",
          },
          body: parameter,
        );
      default:
        return null;
    }
  }
}
