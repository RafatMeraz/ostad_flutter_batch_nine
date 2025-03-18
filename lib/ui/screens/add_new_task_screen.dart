import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/screen_background.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/tm_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  'Add New Task',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Title'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  maxLines: 6,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onTapSubmitButton,
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {}
}
