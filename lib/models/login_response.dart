// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromMap(jsonString);

import 'dart:convert';

class LoginResponse {
    LoginResponse({
        required this.results,
    });

    List<Result> results;

    factory LoginResponse.fromJson(String str) => LoginResponse.fromMap(json.decode(str));

    factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    );
}

class Result {
    Result({
        required this.id,
        required this.usuario,
        required this.contrasena,
    });

    String id;
    String usuario;
    String contrasena;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        usuario: json["usuario"],
        contrasena: json["contrasena"],
    );
}
