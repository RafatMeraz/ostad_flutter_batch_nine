import 'package:get/get.dart';
import 'package:ostad_flutter_batch_nine/data/models/task_list_model.dart';
import 'package:ostad_flutter_batch_nine/data/models/task_model.dart';
import 'package:ostad_flutter_batch_nine/data/service/network_client.dart';
import 'package:ostad_flutter_batch_nine/data/utils/urls.dart';

class NewTaskController extends GetxController {
  bool _getNewTaskInProgress = false;

  bool get getNewTaskInProgress => _getNewTaskInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<TaskModel> _newTaskList = [];

  List<TaskModel> get newTaskList => _newTaskList;

  Future<bool> getNewTaskList() async {
    bool isSuccess = false;

    _getNewTaskInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkClient.getRequest(url: Urls.newTaskListUrl);
    if (response.isSuccess) {
      TaskListModel taskListModel = TaskListModel.fromJson(response.data ?? {});
      _newTaskList = taskListModel.taskList;
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _getNewTaskInProgress = false;
    update();

    return isSuccess;
  }
}
