import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/screen_background.dart';
import 'package:ostad_flutter_batch_nine/ui/widgets/tm_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(
        fromProfileScreen: true,
      ),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  'Update Profile',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 24),
                _buildPhotoPickerWidget(),
                const SizedBox(height: 8),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'First name'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Last name'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Phone'
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Password'
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

  Widget _buildPhotoPickerWidget() {
    return GestureDetector(
      onTap: _onTapPhotoPicker,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 80,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  )),
              alignment: Alignment.center,
              child: const Text(
                'Photo',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            const Text('Select your photo')
          ],
        ),
      ),
    );
  }

  void _onTapPhotoPicker() {}
}
