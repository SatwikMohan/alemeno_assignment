import 'package:alemeno_assignment/core/utils/constants.dart';
import 'package:alemeno_assignment/core/utils/functions.dart';
import 'package:alemeno_assignment/features/data/models/lab_test_model.dart';
import 'package:alemeno_assignment/features/presentation/pages/available_health_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(LabTestModelAdapter());
  await Hive.openBox<LabTestModel>('labtests');
  await requestNotificationPermissions();
  await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
      switch (notificationResponse.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          selectNotificationStream.add(notificationResponse.payload);
          break;
        case NotificationResponseType.selectedNotificationAction:
          if (notificationResponse.actionId == 'id_3') {
            selectNotificationStream.add(notificationResponse.payload);
          }
          break;
      }
    },
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alemeno Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AvailableHealthTestsScreen(),
    );
  }
}
