import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
// import 'package:two_meeter/api/api_repository.dart';
// import 'package:two_meeter/models/response/chat/common_chat_data.dart';
// import 'package:two_meeter/models/response/push_notification/notification_response.dart';
// import 'package:two_meeter/routes/app_pages.dart';

import '../api/api_repository.dart';
import '../models/response/home/notification_response.dart';

// ignore: slash_for_doc_comments
/**
 * Documents added by Alaa, enjoy ^-^:
 * There are 3 major things to consider when dealing with push notification :
 * - Creating the notification
 * - Hanldle notification click
 * - App status (foreground/background and killed(Terminated))
 *
 * Creating the notification:
 *
 * - When the app is killed or in background state, creating the notification is handled through the back-end services.
 *   When the app is in the foreground, we have full control of the notification. so in this case we build the notification from scratch.
 *
 * Handle notification cli
 * ck:
 *
 * - When the app is killed, there is a function called getInitialMessage which
 *   returns the remoteMessage in case we receive a notification otherwise returns null.
 *   It can be called at any point of the application (Preferred to be after defining GetMaterialApp so that we can go to any screen without getting any errors)
 * - When the app is in the background, there is a function called onMessageOpenedApp which is called when user clicks on the notification.
 *   It returns the remoteMessage.
 * - When the app is in the foreground, there is a function flutterLocalNotificationsPlugin, is passes a future function called onSelectNotification which
 *   is called when user clicks on the notification.
 *
 * */

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.data.isNotEmpty) {
    var res = NotificationResponse.fromJson(message.data);
    print("notificationRes222++++++++++++++++++++++++++++$res");
    // if (res.notificationType == "1") {
    //   Get.toNamed(
    //     Routes.CHAT_CONVERSATION,
    //     arguments: [
    //       CommonChatData(
    //         user: CommonChatDataUser(
    //           name: res.fullName,
    //           profile: res.avatar,
    //           userId: int.tryParse(res.senderId!),
    //         ),
    //         type: int.tryParse(res.type!),
    //         message: res.message,
    //         requestStatus: int.tryParse(res.userStatus!.toString())!.obs,
    //       ),
    //     ],
    //   );
    //   // Navigator.pushNamed(context, '/chat',
    //   //     arguments: ChatArguments(message));
    // }
  }
  // AndroidNotificationChannel channel = const AndroidNotificationChannel(
  //   'high_importance_channel', // id
  //   'High Importance Notifications', // title

  //   importance: Importance.high,
  //   description: 'This channel is used for important notifications.',
  // );
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  // // If you're going to use other Firebase services in the background, such as Firestore,
  // // make sure you call `initializeApp` before using other Firebase services.
  // await flutterLocalNotificationsPlugin.show(
  //   message.data.hashCode,
  //   message.data["title"],
  //   "",
  //   NotificationDetails(
  //     android: AndroidNotificationDetails(
  //       channel.id,
  //       channel.name,
  //       channelDescription: channel.description,
  //       icon: message.notification?.android?.smallIcon,
  //       playSound: true,
  //       importance: Importance.max,
  //       priority: Priority.high,
  //       ticker: 'ticker',
  //     ),
  //   ),
  // );
  print('Handling a background message ${message.messageId}');
}

class PushNotificationService {
  PushNotificationService({required this.apiRepository});

  final ApiRepository apiRepository;

  // It is assumed that all messages contain a data field with the key 'type'

  Future<void> setupInteractedMessage() async {
    // Set the background messaging handler early on, as a named top-level function
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String? deviceId;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      deviceId = androidDeviceInfo.androidId;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor;
    }

    // Get any messages which caused the application to open from a terminated state.
    // If you want to handle a notification click when the app is terminated, you can use `getInitialMessage`
    // to get the initial message, and depending in the remoteMessage, you can decide to handle the click
    //This function can be called from anywhere in your app, there is an example in main file.

    await FirebaseMessaging.instance.getToken().then((token) async {
      print('FCM Token===>:$token');
      await apiRepository.fcmToken({
        "deviceId": "$deviceId",
        "token": token
      });
      return;
    });

    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen

    if (initialMessage != null) {
      print("===>>InitialMessage::${initialMessage.notification}");
      if (initialMessage.data.isNotEmpty) {
        //   var res = NotificationResponse.fromJson(initialMessage.data);
        //   if (res.notificationType == "1") {
        //     Get.toNamed(Routes.CHAT_CONVERSATION, arguments: [
        //       CommonChatData(
        //         user: CommonChatDataUser(
        //           name: res.fullName,
        //           profile: res.avatar,
        //           userId: int.tryParse(res.senderId!),
        //         ),
        //         type: int.tryParse(res.type!),
        //         message: res.message,
        //         requestStatus: int.tryParse(res.userStatus!)!.obs,
        //       ),
        //     ]);
        //     // Navigator.pushNamed(context, '/chat',
        //     //     arguments: ChatArguments(message));
        //   }
      }
      // Navigator.pushNamed(context, '/chat',
      //     arguments: ChatArguments(initialMessage));
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    // This function is called when the app is in the background and user clicks on the notification
    FirebaseMessaging.onMessageOpenedApp.listen(
          (RemoteMessage message) {
        print("===>>onMessageOpenedApp::${message.data}");
        if (message.data.isNotEmpty) {
          var res = NotificationResponse.fromJson(message.data);
          print("notificationRes111++++++++++++++++++++++++++++$res");
          // if (res.notificationType == "1") {
          //   Get.toNamed(Routes.CHAT_CONVERSATION, arguments: [
          //     CommonChatData(
          //       user: CommonChatDataUser(
          //         name: res.fullName,
          //         profile: res.avatar,
          //         userId: int.tryParse(res.senderId!),
          //       ),
          //       type: int.tryParse(res.type!),
          //       message: res.message,
          //       requestStatus: int.tryParse(res.userStatus!)!.obs,
          //     ),
          //   ]);
          //   // Navigator.pushNamed(context, '/chat',
          //   //     arguments: ChatArguments(message));
          // }
        }

        // Get.toNamed(NOTIFICATIOINS_ROUTE);

        //[[MapEntry(senderId: 5), MapEntry(fullName: Axay), MapEntry(avatar: https://demo.iroidsolutions.com/2meeters/public/storage/user/profile/APbB14vgsl8N3g31euse4HQnlgdR9bfQ1KaoquZs.jpg), MapEntry(notificationType: 1), MapEntry(body: text message 123), MapEntry(type: 1), MapEntry(title: New message), MapEntry(message: text message 123)]]

        //  [MapEntry(senderId: 5), MapEntry(fullName: Axay), MapEntry(avatar: https://demo.iroidsolutions.com/2meeters/public/storage/user/profile/APbB14vgsl8N3g31euse4HQnlgdR9bfQ1KaoquZs.jpg), MapEntry(notificationType: 1), MapEntry(body: https://demo.iroidsolutions.com/2meeters/public/storage/attachments/FNNYClnpxjQf0nA5tjRmdMoG9j4CEFUfuB8GFnIz.jpg), MapEntry(type: 2), MapEntry(title: New message), MapEntry(message: Sent you a file )]
      },
    );
    if (Platform.isIOS) {
      await enableIOSNotifications();
    }

    await registerNotificationListeners();
  }

  registerNotificationListeners() async {
    AndroidNotificationChannel channel = androidNotificationChannel();
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    if (!Platform.isAndroid) {
      _requestPermissions(flutterLocalNotificationsPlugin);
    }

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    var androidSettings =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSSettings = const IOSInitializationSettings();
    var initSetttings =
    InitializationSettings(android: androidSettings, iOS: iOSSettings);
    flutterLocalNotificationsPlugin.initialize(
      initSetttings,
      onSelectNotification: (message) async {
        print("===>Message2323:$message");
        // This function handles the click in the notification when the app is in foreground
        // if (message.data.isNotEmpty) {
        //   var res = NotificationResponse.fromJson(message.data);
        //   if (res.notificationType == 1) {
        //     Get.toNamed(
        //       Routes.CHAT_CONVERSATION,
        //       arguments: CommonChatData(
        //         user: CommonChatDataUser(
        //           name: res.fullName,
        //           profile: res.avatar,
        //           userId: int.tryParse(res.senderId!),
        //         ),
        //         type: int.tryParse(res.type!),
        //         message: res.message,
        //       ),
        //     );
        //     // Navigator.pushNamed(context, '/chat',
        //     //     arguments: ChatArguments(message));
        //   }
        // }
        // Get.toNamed(NOTIFICATIOINS_ROUTE);
      },
    );
    // onMessage is called when the app is in foreground and a notification is received
    FirebaseMessaging.onMessage.listen(
          (RemoteMessage? remoteMessage) async {
        // Get.find<HomeController>().getNotificationsNumber();
        print("===>remoteMessage :${remoteMessage!.data.entries.toList()}");
        RemoteNotification? notification = remoteMessage.notification;
        AndroidNotification? android = remoteMessage.notification?.android;

        Map<String,dynamic> dataMap = remoteMessage.data;

        String title = dataMap['title'];
        String message = dataMap['message'];

        // If `onMessage` is triggered with a notification, construct our own
        // local notification to show to users using the created channel.
        if (notification != null && android != null) {
          await flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            message,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: android.smallIcon,
                playSound: true,
                importance: Importance.max,
                priority: Priority.high,
                ticker: 'ticker',
              ),
            ),
          );
        }
      },
    );
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

    importance: Importance.high,
    description: 'This channel is used for important notifications.',
  );

  void _requestPermissions(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
