class TaskStatusCountModel {
  late final String status;
  late final int count;

  TaskStatusCountModel.fromJson(Map<String, dynamic> jsonData) {
    status = jsonData['_id'];
    count = jsonData['sum'];
  }
}
