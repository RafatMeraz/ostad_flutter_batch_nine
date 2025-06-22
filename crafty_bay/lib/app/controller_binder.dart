import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(
      NetworkClient(
        onUnAuthorize: _onUnAuthorize,
        commonHeaders: _commonHeaders,
      ),
    );
  }

  void _onUnAuthorize() {
    // TODO: Logout from app and re-login
  }

  final Map<String, String> _commonHeaders = {
    'content-type': 'application/json',
    'token': '',
  };
}
