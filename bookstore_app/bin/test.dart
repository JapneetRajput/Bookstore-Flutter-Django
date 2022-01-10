import 'dart:convert';

import 'package:http/http.dart' as http;

main() async {
  // var response = await http.get(Uri.parse("http://127.0.0.1:8000/core/a"));
  var response = await http.post(Uri.parse("http://127.0.0.1:8000/core/a"),
  body:{
    "username": "Arjun",
    "email": "arjun@gmail.com",
    "password":"Commando@007"
  });
  print(jsonDecode(response.body)["Username"]);
  print(jsonDecode(response.body)["email"]);
}
