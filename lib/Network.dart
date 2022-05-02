import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
const apiKey='';

String appId = '626e0a9fa360c85b91a98b33';

class NetworkHelper
{
  final String url;
  NetworkHelper(this.url);
  Future getData() async
  {
    http.Response response = await http.get(Uri.parse(url), headers: {'app-id': appId});
    print(response);
    if (response.statusCode <= 250) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      print("data fetched from network");
      return decodedData;
    }
    else {
      print(response.statusCode);
    }
  }
}