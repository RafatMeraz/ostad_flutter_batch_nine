import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/data/models/verify_otp_request_model.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;


  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  // TODO: Data class

  // Actual method
  Future<bool> verifyOtp(VerifyOtpRequestModel model) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>()
        .postRequest(Urls.verifyOtpUrl, body: model.toJson());
    if (response.isSuccess) {
      // Save user data
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
