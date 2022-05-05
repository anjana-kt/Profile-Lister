import 'package:profile_lister/Network.dart';
int limit = 100;
class ProfileData {
  String frontUrl='https://dummyapi.io/data/v1';

  Future getProfileData()async {
      var data= await NetworkHelper('$frontUrl/user?page=1&limit=${limit.toString()}').getData();
      //rate.add(coinData['rate']);
      //print(" ${Data['rate']}");
      //price=Data['rate'].toStringAsFixed(0);
      //print(data);
      print(data['data'][0]['firstName']);
    return data;
  }
}