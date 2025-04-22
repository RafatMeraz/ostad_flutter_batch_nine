import 'package:get/get.dart';
import 'package:ostad_flutter_batch_nine/ui/controllers/login_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}