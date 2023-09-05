import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<Map<dynamic, dynamic>> login(String email, String password) async {
    setLoading(true);
    try {
      http.Response response =
          await http.post(Uri.parse("https://reqres.in/api/register"), body: {
        "username": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        print(response.body);
        Map res = jsonDecode(response.body);
        setLoading(false);
        return res;
      }
      log(response.statusCode.toString());
      Map res = jsonDecode(response.body);
      setLoading(false);
      return res;
    } catch (e) {
      log(e.toString());
      setLoading(false);
      return {"error": e.toString()};
    }
  }
}
