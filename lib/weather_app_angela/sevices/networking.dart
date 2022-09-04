
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper{
  final String urlpath;

  NetworkHelper(this.urlpath);
  Future getWeatherData()async{
    Uri url = Uri.parse(urlpath);
    http.Response response = await http.Client().get(url);
    if(response.statusCode==200){
      String data =response.body;
      print(data);
      var decodedjson =jsonDecode(data);
      return decodedjson;
    }else{
      print(response.statusCode);
    }
  }
}