import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: GetBuilder(
          init: counterController,
          builder: (controller) {
            return Text(
              '${counterController.count}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            );
          },
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

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key, required this.counterController});
//
//   final CounterController counterController;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: Center(
//         child: Text(''),
//       ),
//     );
//   }
// }

// class CounterController {
//   RxInt count = 0.obs;
//
//   void incrementCount() {
//     count++;
//   }
// }

class CounterController extends GetxController {
  int count = 0;

  void incrementCount() {
    count++;
    update();
  }
}
