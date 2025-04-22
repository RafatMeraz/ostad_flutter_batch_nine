import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_batch_nine/counter_controller.dart';
import 'package:ostad_flutter_batch_nine/profile_screen.dart';
import 'package:ostad_flutter_batch_nine/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CounterController counterController = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder(
              init: counterController,
              builder: (controller) {
                return Text(
                  '${counterController.count}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                );
              },
            ),
            TextButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return const ProfileScreen();
                // }));
                Get.to(const ProfileScreen());
                // Get.toNamed('/profile');
              },
              child: const Text('Go to profile'),
            ),
            TextButton(
              onPressed: () {
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                //   return const SettingsScreen();
                // }));
                Get.off(const SettingsScreen());
                // Context-less navigation
              },
              child: const Text('Go to settings'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.incrementCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
