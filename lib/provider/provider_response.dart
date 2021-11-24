import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca_flutter/models/login_response.dart';

class ProviderResponse extends ChangeNotifier{

  String _apiKey = '1utZEWQ3pPWQvF5RWCvnT1mqz_yumfsOzhiWHtYvqWrc';
  String _baseUrl = 'opensheet.vercel.app';
  String _nombreHoja = '1';

  List<Result> listaLoginResponse = [];

  ProviderResponse(){

    print('Providers Response inicializada');

    this.getLoginResponse();
  }

  Future<String>_getJsonData()async{
        final url = Uri.https(_baseUrl, _apiKey + "/" + _nombreHoja); 
        final response = await http.get(url);
        return response.body;

      }

     getLoginResponse() async{
       String jsonData = await this._getJsonData();
       jsonData = '{"results":' + jsonData + "}";
       final loginResponse = LoginResponse.fromJson(jsonData);
       listaLoginResponse = [...loginResponse.results];

       print(jsonData);

       notifyListeners();
    }
}