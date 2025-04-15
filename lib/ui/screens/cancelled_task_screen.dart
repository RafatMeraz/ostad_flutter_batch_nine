import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_nine/data/models/task_list_model.dart';
import 'package:ostad_flutter_batch_nine/data/models/task_model.dart';
import 'package:ostad_flutter_batch_nine/data/service/network_client.dart';
import 'package:ostad_flutter_batch_nine/data/utils/urls.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/snack_bar_message.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/task_card.dart';

class CancelledTaskScreen extends StatefulWidget {
  const CancelledTaskScreen({super.key});

  @override
  State<CancelledTaskScreen> createState() => _CancelledTaskScreenState();
}

class _CancelledTaskScreenState extends State<CancelledTaskScreen> {
  bool _getCancelledTasksInProgress = false;
  List<TaskModel> _cancelledTaskList = [];

  @override
  void initState() {
    super.initState();
    _getAllCancelledTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: _getCancelledTasksInProgress == false,
        replacement: const CenteredCircularProgressIndicator(),
        child: ListView.separated(
          itemCount: _cancelledTaskList.length,
          itemBuilder: (context, index) {
            return TaskCard(
              taskStatus: TaskStatus.cancelled,
              taskModel: _cancelledTaskList[index],
              refreshList: _getAllCancelledTaskList,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }

  Future<void> _getAllCancelledTaskList() async {
    _getCancelledTasksInProgress = true;
    setState(() {});
    final NetworkResponse response =
    await NetworkClient.getRequest(url: Urls.cancelledTaskListUrl);
    if (response.isSuccess) {
      TaskListModel taskListModel = TaskListModel.fromJson(response.data ?? {});
      _cancelledTaskList = taskListModel.taskList;
    } else {
      showSnackBarMessage(context, response.errorMessage, true);
    }

    _getCancelledTasksInProgress = false;
    setState(() {});
  }
}
