import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:myshop/screens/animated_bottom_bar.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService = NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('logo');

    const IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        defaultPresentAlert: true,
        defaultPresentBadge: true,
        defaultPresentSound: true);

    const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotificationShow);

    tz.initializeTimeZones();
  }

  void onSelectNotificationShow(String? payload) async {
    AnimatedBottomBar.bottomBarTabController.jumpToTab(0);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> showNotificationWithSound(int id, String title, String body, int seconds) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'your channel id', 'your channel name',
        sound: RawResourceAndroidNotificationSound('slow_spring_board'),
        importance: Importance.max,
        playSound: true,
        enableVibration: true,
        priority: Priority.high);
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
        // sound: "slow_spring_board",
        presentSound: true,
        presentAlert: true,
        presentBadge: true,
        badgeNumber: 12
        // subtitle: "Amit"
        );
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        123,
        "Alert Festival Sell",
        "Subscribe now to get offer and get 50% vouchers for electric and fashion shopping",
        tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        payload: "Custome_pod");
  }
}
