import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_nine/ui/screens/update_profile_screen.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
    this.fromProfileScreen,
  });

  final bool? fromProfileScreen;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          if (fromProfileScreen ?? false) {
            return;
          }
          _onTapProfileSection(context);
        },
        child: Row(
          children: [
            const CircleAvatar(
              radius: 16,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rahim Hasan',
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'rahim@gmail.com',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }

  void _onTapProfileSection(BuildContext context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const UpdateProfileScreen(),),);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
