import 'dart:async';
import 'package:alemeno_assignment/features/domain/entities/tests_class.dart';
import 'package:alemeno_assignment/features/presentation/widgets/popular_packages_tile.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


final LOAD_POPULAR_LAB_TESTS = [
  LabTest(name: "Thyroid Profile", numberOfTests: 3, resultOutTime: 24, currPrice:100, discardedPrice: 500,mark: false),
  LabTest(name: "Iron Study Test", numberOfTests: 1, resultOutTime: 24, currPrice:200, discardedPrice: 600,mark: false),
  LabTest(name: "Corona Test", numberOfTests: 2, resultOutTime: 24, currPrice:300, discardedPrice: 700,mark: false),
  LabTest(name: "Blood Test", numberOfTests: 3, resultOutTime: 24, currPrice:400, discardedPrice: 800,mark: false)
];

final TIME_LIST = [
  "08:00","09:00","10:00",
  "11:00","12:00","13:00",
  "14:00","15:00","16:00",
  "17:00","18:00","19:00"
];

String DESCRIPTION ="Reports will be delivered within 3-4 working days. Hard copy charges are non-refundable once the reports have been dispatched\n\n\$150 per person";

final POPULAR_PACKAGES_LIST= [
  PopularPackages("Full Body Checkup",2000),
  PopularPackages("Heart Care",1500),
];

int NOTIFICATION_ID = 0;
class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream = StreamController<ReceivedNotification>.broadcast();
final StreamController<String?> selectNotificationStream = StreamController<String?>.broadcast();
const MethodChannel platform = MethodChannel('dexterx.dev/flutter_local_notifications_example');
const String portName = 'notification_send_port';
const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
final List<DarwinNotificationCategory> darwinNotificationCategories =
<DarwinNotificationCategory>[
  DarwinNotificationCategory(
    'darwinNotificationCategoryText',
    actions: <DarwinNotificationAction>[
      DarwinNotificationAction.text(
        'text_1',
        'Action 1',
        buttonTitle: 'Send',
        placeholder: 'Placeholder',
      ),
    ],
  ),
  DarwinNotificationCategory(
    'darwinNotificationCategoryPlain',
    actions: <DarwinNotificationAction>[
      DarwinNotificationAction.plain('id_1', 'Action 1'),
      DarwinNotificationAction.plain(
        'id_2',
        'Action 2 (destructive)',
        options: <DarwinNotificationActionOption>{
          DarwinNotificationActionOption.destructive,
        },
      ),
      DarwinNotificationAction.plain(
        'id_3',
        'Action 3 (foreground)',
        options: <DarwinNotificationActionOption>{
          DarwinNotificationActionOption.foreground,
        },
      ),
      DarwinNotificationAction.plain(
        'id_4',
        'Action 4 (auth required)',
        options: <DarwinNotificationActionOption>{
          DarwinNotificationActionOption.authenticationRequired,
        },
      ),
    ],
    options: <DarwinNotificationCategoryOption>{
      DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
    },
  )
];
final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(
  requestAlertPermission: false,
  requestBadgePermission: false,
  requestSoundPermission: false,
  onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
    didReceiveLocalNotificationStream.add(
      ReceivedNotification(
        id: id,
        title: title,
        body: body,
        payload: payload,
      ),
    );
  },
  notificationCategories: darwinNotificationCategories,
);
final InitializationSettings initializationSettings = InitializationSettings(
  android: initializationSettingsAndroid
);