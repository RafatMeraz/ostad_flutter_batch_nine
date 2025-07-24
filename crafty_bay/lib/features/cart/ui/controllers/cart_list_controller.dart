import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/cart/data/models/cart_item_model.dart';
import 'package:get/get.dart';
import 'package:network_caller/network_caller.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  List<CartItemModel> _cartItemList = [];

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  List<CartItemModel> get cartItemList => _cartItemList;

  Future<bool> getCartItemList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.getCartItemListUrl,
    );
    if (response.isSuccess) {
      List<CartItemModel> list = [];
      for (Map<String, dynamic> json
          in response.responseData!['data']['results']) {
        list.add(CartItemModel.fromJson(json));
      }
      _cartItemList = list;
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }

  int get totalPrice {
    int total = 0;
    for (CartItemModel cartItem in _cartItemList) {
      total += (cartItem.productModel.currentPrice * cartItem.quantity);
    }
    return total;
  }

  void updateQuantity(String cartItemId, int quantity) {
    for (CartItemModel cartItemModel in _cartItemList) {
      if (cartItemModel.id == cartItemId) {
        cartItemModel.quantity = quantity;
        update();
        break;
      }
    }
  }
}
