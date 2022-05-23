import 'package:dio/dio.dart';
import 'package:envo_safe/app/data/api_provider/exeptions/exceptions.dart';

import '../api_client.dart';

class ImageRepo {
  Future<String> upload({required String imagePath}) async {    
      var data =
          FormData.fromMap({"image": await MultipartFile.fromFile(imagePath)});
      Response r = await ApiClient().dio.post("/upload/image", data: data);
      return r.data["data"]["image"];    
  }
}
