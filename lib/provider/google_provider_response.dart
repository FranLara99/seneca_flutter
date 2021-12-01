import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_flutter/models/google_response.dart';

class GoogleProviderResponse extends ChangeNotifier{

  String _apiKey = '1utZEWQ3pPWQvF5RWCvnT1mqz_yumfsOzhiWHtYvqWrc';
  String _baseUrl = 'opensheet.vercel.app';
  String _nombreHoja = '2';

  List<Result> listaGoogleLoginResponse = [];

  GoogleProviderResponse(){

    print('Providers Google Response inicializada');

    this.getGoogleLoginResponse();
  }

  Future<String>_getJsonData()async{
        final url = Uri.https(_baseUrl, _apiKey + "/" + _nombreHoja); 
        final response = await http.get(url);
        return response.body;

      }

     getGoogleLoginResponse() async{
       String jsonData = await this._getJsonData();
       jsonData = '{"results":' + jsonData + "}";
       final googleLoginResponse = GoogleResponse.fromJson(jsonData);
       listaGoogleLoginResponse = [...googleLoginResponse.results];

       print(jsonData);

       notifyListeners();
    }
}