import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/common/models/product_model.dart';
import 'package:get/get.dart';
import 'package:network_caller/network_caller.dart';

class ProductListByCategoryController extends GetxController {
  final int _count = 30;

  int _currentPage = 0;

  int? _lastPage;

  bool _inProgress = false;

  bool _initialLoadingInProgress = false;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  bool get initialLoadingInProgress => _initialLoadingInProgress;

  String? get errorMessage => _errorMessage;

  final List<ProductModel> _productModelList = [];

  List<ProductModel> get productModelList => _productModelList;

  Future<void> getProductList(String categoryId) async {
    _currentPage++;

    if (_lastPage != null && _lastPage! < _currentPage) {
      return;
    }

    if (_currentPage == 1) {
      _productModelList.clear();
      _initialLoadingInProgress = true;
    } else {
      _inProgress = true;
    }
    update();

    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.productListByCategoryUrl(_count, _currentPage, categoryId),
    );
    if (response.isSuccess) {
      _lastPage = response.responseData!['data']['last_page'] ?? 0;
      List<ProductModel> list = [];
      for (Map<String, dynamic> product
          in response.responseData!['data']['results']) {
        list.add(ProductModel.fromJson(product));
      }
      _productModelList.addAll(list);
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage!;
    }

    if (_currentPage == 1) {
      _initialLoadingInProgress = false;
    } else {
      _inProgress = false;
    }
    update();
  }
}
