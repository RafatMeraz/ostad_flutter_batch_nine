import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_nine/data/models/task_list_model.dart';
import 'package:ostad_flutter_batch_nine/data/models/task_model.dart';
import 'package:ostad_flutter_batch_nine/data/service/network_client.dart';
import 'package:ostad_flutter_batch_nine/data/utils/urls.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/snack_bar_message.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  bool _getProgressTasksInProgress = false;
  List<TaskModel> _progressTaskList = [];

  @override
  void initState() {
    super.initState();
    _getAllProgressTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: _getProgressTasksInProgress == false,
        replacement: const CenteredCircularProgressIndicator(),
        child: ListView.separated(
          itemCount: _progressTaskList.length,
          itemBuilder: (context, index) {
            return TaskCard(
              taskStatus: TaskStatus.progress,
              taskModel: _progressTaskList[index],
              refreshList: _getAllProgressTaskList,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }

  Future<void> _getAllProgressTaskList() async {
    _getProgressTasksInProgress = true;
    setState(() {});
    final NetworkResponse response =
        await NetworkClient.getRequest(url: Urls.progressTaskListUrl);
    if (response.isSuccess) {
      TaskListModel taskListModel = TaskListModel.fromJson(response.data ?? {});
      _progressTaskList = taskListModel.taskList;
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }

    _getProgressTasksInProgress = false;
    setState(() {});
  }
}
