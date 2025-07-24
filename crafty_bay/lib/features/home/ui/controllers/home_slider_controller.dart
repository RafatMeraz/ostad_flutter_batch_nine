import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/features/home/data/models/slider_model.dart';
import 'package:get/get.dart';
import 'package:network_caller/network_caller.dart';

class HomeSliderController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  List<SliderModel> _sliderModelList = [];

  List<SliderModel> get sliderModelList => _sliderModelList;

  Future<bool> getHomeSliders() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkClient>().getRequest(
      Urls.homeSliderUrl,
    );
    if (response.isSuccess) {
      List<SliderModel> list = [];
      for (Map<String, dynamic> slider
          in response.responseData!['data']['results']) {
        list.add(SliderModel.fromJson(slider));
      }
      _sliderModelList = list;
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
