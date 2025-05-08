import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ostad_flutter_batch_nine/app.dart';

import 'fcm_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FcmService().init();
  print(await FcmService().getFcmToken());
  runApp(const LiveScoreApp());
}