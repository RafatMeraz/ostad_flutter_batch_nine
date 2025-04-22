import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_nine/home_screen.dart';

import 'counter_controller.dart';
import 'main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder<CounterController>(builder: (controller) {
              return Text(controller.count.toString());
            }),
            TextButton(
              onPressed: () {
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => const HomeScreen()),
                //   (predicate) => false,
                // );
                Get.offAll(const HomeScreen(), predicate: (_) => false);
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CounterController>().incrementCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
