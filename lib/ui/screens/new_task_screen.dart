import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_nine/ui/screens/add_new_task_screen.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/summary_card.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/task_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSummarySection(),
            ListView.separated(
              itemCount: 6,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const TaskCard(taskStatus: TaskStatus.sNew);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onTapAddNewTask() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddNewTaskScreen(),
      ),
    );
  }

  Widget _buildSummarySection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            SummaryCard(
              title: 'New',
              count: 12,
            ),
            SummaryCard(
              title: 'Progress',
              count: 23,
            ),
            SummaryCard(
              title: 'Completed',
              count: 3,
            ),
            SummaryCard(
              title: 'Cancelled',
              count: 25,
            ),
          ],
        ),
      ),
    );
  }
}
