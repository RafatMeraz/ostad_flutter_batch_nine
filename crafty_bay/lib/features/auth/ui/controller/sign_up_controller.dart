import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_request_model.dart';
import 'package:get/get.dart';
import 'package:network_caller/network_caller.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  late String _message;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  String get message => _message;

  // Actual method
  Future<bool> signUp(SignUpRequestModel model) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.signUpUrl, body: model.toJson());
    if (response.isSuccess) {
      _message = response.responseData!['msg'];
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
