
// ignore_for_file: file_names

import 'package:http/http.dart' as http;
import '../models/ProvinceModel.dart';

class ProvinceController {
  Future<ProvinceModel> fetch() async {
    const String url = "http://103.110.9.59/bi/api/province/list";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return provinceModelFromJson(response.body);
    } else {
      return ProvinceModel();
    }
  }
}
