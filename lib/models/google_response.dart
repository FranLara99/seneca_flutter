// To parse this JSON data, do
//
//     final googleResponse = googleResponseFromMap(jsonString);

import 'dart:convert';

class GoogleResponse {
    GoogleResponse({
        required this.results,
    });

    List<Result> results;

    factory GoogleResponse.fromJson(String str) => GoogleResponse.fromMap(json.decode(str));

    factory GoogleResponse.fromMap(Map<String, dynamic> json) => GoogleResponse(
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
    );
}

class Result {
    Result({
        required this.id,
        required this.correo,
    });

    String id;
    String correo;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        correo: json["correo"],
    );
}
