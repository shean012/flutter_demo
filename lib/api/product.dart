import 'package:flutter_demo/entity/product.dart';
import 'package:flutter_demo/common/request/request.dart';

class ProductApi {
  static Future<dynamic> getProduct() async {
    var res = await Request().get('/home/index', cache: false);
    return HomeProductsRes.fromJson(res);
  }
}
