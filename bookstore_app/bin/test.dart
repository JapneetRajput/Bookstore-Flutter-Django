import 'dart:convert';

import 'package:http/http.dart' as http;

main() async {
  AuthService authService = AuthService();

  // final logoutUrl = Uri.parse("http://127.0.0.1:8000/accounts/logout/");

  // var response = await http.get(logoutUrl, headers: {
  //   "Authorization": "Token f1207a4373cc84d3badc33c8afe24b1f49d9f3e9"
  // });

  var response = await http
      .get(Uri.parse("http://127.0.0.1:8000/accounts/user/"), headers: {
    "Authorization": "Token f1207a4373cc84d3badc33c8afe24b1f49d9f3e9"
  });
  print(response.body);

// f1207a4373cc84d3badc33c8afe24b1f49d9f3e9

  // LoginResponse? loginResponse = await authService.login(
  //   "Arj23",
  //   "Commandoo",
  // );
  // if (loginResponse != null) {
  //   if (loginResponse.key != null) print(loginResponse.key);
  //   if (loginResponse.non_field_erros != null)
  //     loginResponse.non_field_erros!.forEach((element) {
  //       print(element);
  //     });
  // }

  // RegistrationResponse? registrationResponse = await authService.registration(
  //     "Arj23", "Commandoo", "Commandoo", "japneetrajput23@gmai.com");
  // if (registrationResponse != null) {
  //   if (registrationResponse.email != null) {
  //     registrationResponse.email!.forEach((element) {
  //       print(element);
  //     });
  //   }

  //   if (registrationResponse.username != null) {
  //     registrationResponse.username!.forEach((element) {
  //       print(element);
  //     });
  //   }
  //   if (registrationResponse.non_field_errors != null) {
  //     registrationResponse.non_field_errors!.forEach((element) {
  //       print(element);
  //     });
  //   }
  //   if (registrationResponse.password1 != null) {
  //     registrationResponse.password1!.forEach((element) {
  //       print(element);
  //     });
  //   }
  //   if (registrationResponse.key != null) {
  //     print(registrationResponse.key!);
  //   }
  // }
}

class AuthService {
  final registrationUri = Uri.parse("http://127.0.0.1:8000/registration/");
  final loginUri = Uri.parse("http://127.0.0.1:8000/accounts/login/");
  final logoutUrl = Uri.parse("http://127.0.0.1:8000/accounts/logout/");

  Future<RegistrationResponse?> registration(
      String username, String password1, String password2, String email) async {
    var response = await http.post(registrationUri, body: {
      "username": username,
      "password1": password1,
      "password2": password2,
      "email": email,
    });
    return RegistrationResponse.fromJson(jsonDecode(response.body));
  }

  Future<LoginResponse?> login(String usernameOremail, String password) async {
    var response = await http.post(loginUri, body: {
      "username": usernameOremail,
      "password": password,
    });
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}

// Commando007
// {"key":"8e6b29c28e64a63fbd3222ba6d26ec8ff59fcddf"}
// {"username":["A user with that username already exists."],"email":["A user is already registered with this e-mail address."]}

//{"password1":["This password is too short. It must contain at least 8 characters.","This password is too common.","This password is entirely numeric."]}

//{"non_field_errors":["The two password fields didn't match."]}

class RegistrationResponse {
  List<dynamic>? non_field_errors;
  List<dynamic>? password1;
  List<dynamic>? username;
  List<dynamic>? email;
  dynamic? key;

  RegistrationResponse({
    this.email,
    this.key,
    this.non_field_errors,
    this.password1,
    this.username,
  });

  factory RegistrationResponse.fromJson(mapOfBody) {
    return RegistrationResponse(
      email: mapOfBody["email"],
      key: mapOfBody["key"],
      non_field_errors: mapOfBody["non_field_errors"],
      password1: mapOfBody["password1"],
      username: mapOfBody["username"],
    );
  }
}

// login response {"key": "f1207a4373cc84d3badc33c8afe24b1f49d9f3e9"}
//{"non_field_errors": ["Must include \"username\" and \"password\"."]}
//{"non_field_errors": ["Unable to log in with provided credentials."]}

class LoginResponse {
  dynamic? key;
  List<dynamic>? non_field_erros;
  LoginResponse({this.key, this.non_field_erros});

  factory LoginResponse.fromJson(mapOfBody) {
    return LoginResponse(
      key: mapOfBody['key'],
      non_field_erros: mapOfBody['non_field_errors'],
    );
  }
}
