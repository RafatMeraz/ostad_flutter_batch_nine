import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title will be here',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Text('Description will be here'),
            const Text('Date: 12/23/25'),
            Row(
              children: [
                Chip(
                  label: const Text(
                    'New',
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  backgroundColor: Colors.blue,
                  side: BorderSide.none,
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
