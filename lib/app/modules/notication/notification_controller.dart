import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  // It is assumed that all messages contain a data field with the key 'type'
  Future<void> setupInteractedMessage() async {
    await Firebase.initializeApp();

// Get any messages which caused the application to open from a terminated state.
    // If you want to handle a notification click when the app is terminated, you can use `getInitialMessage`
    // to get the initial message, and depending in the remoteMessage, you can decide to handle the click
    // This function can be called from anywhere in your app, there is an example in main file.
    // RemoteMessage initialMessage =
    //     await FirebaseMessaging.instance.getInitialMessage();
    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    // if (initialMessage != null && initialMessage.data['type'] == 'chat') {
    // Navigator.pushNamed(context, '/chat',
    //     arguments: ChatArguments(initialMessage));
    // }
// Also handle any interaction when the app is in the background via a
    // Stream listener
    // This function is called when the app is in the background and user clicks on the notification
    final bool isBadgeSupported = await FlutterAppBadger.isAppBadgeSupported();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      FlutterAppBadger.removeBadge();
      // print(message.notification.body);
      // Get.toNamed(NOTIFICATIOINS_ROUTE);
    });

    FirebaseMessaging.onBackgroundMessage((message) async {
      // print("===================");
      // print(isBadgeSupported!);
      if (isBadgeSupported) {
        FlutterAppBadger.updateBadgeCount(1);
      }
    });

    await enableIOSNotifications();
    await registerNotificationListeners();
  }

  registerNotificationListeners() async {
    final AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // IOSInitializationSettings DarwinInitializationSettings
    const iOSSettings = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    const initSetttings =
        InitializationSettings(android: androidSettings, iOS: iOSSettings);
    await flutterLocalNotificationsPlugin.initialize(initSetttings,
        // onSelectNotification onDidReceiveNotificationResponse
        onDidReceiveNotificationResponse: (message) async {
      // This function handles the click in the notification when the app is in foreground
      // Get.toNamed(NOTIFICATIOINS_ROUTE);
    });

    /// ----------------------------------onMESSAGE_RECIEVED-------------------------
// onMessage is called when the app is in foreground and a notification is received
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final RemoteNotification? notification = message.notification;
      final AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              enableVibration: true,
              channelDescription: channel.description,
              icon: android.smallIcon,
              playSound: true,
            ),
          ),
        );
      }
    });
  }

  enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }

  androidNotificationChannel() => const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
            'This channel is used for important notifications.', // description
        importance: Importance.max,
      );
}
