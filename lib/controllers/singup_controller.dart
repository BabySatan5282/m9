import 'dart:convert';
import 'package:get/get.dart';

import '../models/url_model.dart';
import '../network/api_exception.dart';
import '../network/api_service.dart';

class SingupController extends GetxController with StateMixin<UrlModel> {
  final ApiService _apiService = Get.find();

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  getData() async {
    try {
      change(null, status: RxStatus.loading());
      String res = await _apiService.get("/2024/05/link.html");
      int start = res.indexOf("{ &quot;");
      int end = res.indexOf("&quot; }");
      res = res.substring(start, end + 8);
      res = res.replaceAll("&quot;", '"');
      UrlModel urlModel = UrlModel.fromJson(jsonDecode(res));

      change(urlModel, status: RxStatus.success());
    } on ApiException catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
