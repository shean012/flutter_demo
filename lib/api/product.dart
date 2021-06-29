import 'package:flutter_demo/entity/product.dart';
import 'package:flutter_demo/common/request/request.dart';
import 'package:flutter_demo/common/utils/requsetUrl.dart';

class ProductApi {
  static Future<dynamic> getProduct() async {
    var url = getRequsetUrl('getProductUrl');
    var res = await Request()
        .get(url, params: {"test": 2313, "name": 'huanjie'}, cache: false);
    return HomeProductsRes.fromJson(res);
  }
}
