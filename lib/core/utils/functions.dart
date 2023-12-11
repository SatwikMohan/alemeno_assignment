import 'dart:io';

import 'package:alemeno_assignment/core/utils/constants.dart';
import 'package:alemeno_assignment/features/domain/entities/tests_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

bool check(LabTest test,List<LabTest> cartList){
  int f=0;
  cartList.forEach((element) {
    if((element.name==test.name)&&(element.numberOfTests==test.numberOfTests)){
      f=1;
    }
  });
  if(f==1){
    return true;
  }else{
    return false;
  }
}

int totalCurrPrice(List<LabTest> list){
  int sum=0;
  list.forEach((element) {
    sum+=element.currPrice;
  });
  return sum;
}

int totalDiscardedPrice(List<LabTest> list){
  int sum=0;
  list.forEach((element) {
    sum+=element.discardedPrice;
  });
  return sum;
}

int getTotalSavings(List<LabTest> list){
  return totalDiscardedPrice(list) - totalCurrPrice(list);
}

ButtonStyle getButtonStyle(Color color){
  return ButtonStyle(
    backgroundColor:MaterialStateProperty.all(
        color
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.blue.shade900)
        )
    ),
  );
}

SliverGridDelegate getDelegate(int crossAxisCount, double mainAxisSpacing, double crossAxisSpacing, double childAspectRatio){
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: crossAxisCount, // number of items in each row
    mainAxisSpacing: mainAxisSpacing, // spacing between rows
    crossAxisSpacing: crossAxisSpacing, // spacing between columns
    childAspectRatio: childAspectRatio,
  );
}

Future<void> requestNotificationPermissions() async {
  if (Platform.isIOS || Platform.isMacOS) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  } else if (Platform.isAndroid) {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

    final bool? grantedNotificationPermission =
    await androidImplementation?.requestNotificationsPermission();
  }
}

Future<void> showNotification(String message) async {
  const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'your channel id', 'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      icon: '@mipmap/ic_launcher'
  );
  const NotificationDetails notificationDetails =
  NotificationDetails(android: androidNotificationDetails);
  await flutterLocalNotificationsPlugin
      .show(NOTIFICATION_ID++, 'Happy Testing', message, notificationDetails, payload: 'item ${message}');
}
