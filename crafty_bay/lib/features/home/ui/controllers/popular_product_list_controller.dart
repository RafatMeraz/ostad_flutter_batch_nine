import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/common/models/product_model.dart';
import 'package:get/get.dart';
import 'package:network_caller/network_caller.dart';

class PopularProductController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  List<ProductModel> _productModelList = [];

  List<ProductModel> get productModelList => _productModelList;

  Future<bool> getPopularProducts() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.productsByTagUrl('Popular'),
    );
    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String, dynamic> slider
          in response.responseData!['data']['results']) {
        list.add(ProductModel.fromJson(slider));
      }
      _productModelList = list;
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
