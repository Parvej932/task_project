import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class AlarmController extends GetxController {
  var location = ''.obs;
  var alarms = <DateTime>[].obs;

  // 🔁 switchMap merged here (alarmId -> switch value)
  var switchMap = <int, RxBool>{}.obs;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    initNotifications();
    fetchLocation();
  }

  Future<void> initNotifications() async {
    tz.initializeTimeZones();

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await flutterLocalNotificationsPlugin.initialize(settings);
  }

  Future<void> fetchLocation() async {
    var status = await Permission.location.request();

    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      location.value =
      'Lat: ${position.latitude}, Long: ${position.longitude}';
    } else if (status.isPermanentlyDenied) {
      location.value = 'Permission permanently denied';
      openAppSettings();
    } else {
      location.value = 'Location permission denied';
    }
  }

  void addAlarm(DateTime dateTime) {
    alarms.add(dateTime);
    int id = dateTime.millisecondsSinceEpoch;

    switchMap[id] = true.obs;
    scheduleAlarm(dateTime, id);
  }

  void toggleAlarm(int id, bool value, DateTime dateTime) {
    switchMap[id]?.value = value;

    if (value) {
      scheduleAlarm(dateTime, id);
    } else {
      cancelAlarm(id);
    }
  }

  Future<void> scheduleAlarm(DateTime dateTime, int id) async {
    final tzDate = tz.TZDateTime.from(dateTime, tz.local);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      'Alarm',
      'Your alarm is ringing!',
      tzDate,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_channel',
          'Alarm Notifications',
          channelDescription: 'Channel for alarm notifications',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancelAlarm(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
