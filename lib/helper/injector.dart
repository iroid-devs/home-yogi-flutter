// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../shared/constants/pref_keys.dart';
//
// class Injector {
//   static Injector? _instance;
//   static String? email;
//   static bool isDarkMode = false;
//   static FirebaseMessaging? firebaseMessaging;
//   static FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//  // static DeviceInfoPlugin? deviceInfo = DeviceInfoPlugin();
//
//   // static FacebookAuth facebookAuth = FacebookAuth.instance;
//
//   //OBJECTS
//   static final storage = GetStorage(); // instance of getStorage class
//   static int? userId;
//
//   // static UserModel? userData;
//   static int notificationID = 0;
//
//   factory Injector() {
//     return _instance ?? Injector._internal();
//   }
//
//   Injector._internal() {
//     _instance = this;
//   }
//
//   static Injector get shared => Injector();
//
//   static getInstance() async {
//     // firebaseMessaging = FirebaseMessaging.instance;
//     await GetStorage.init(); //get storage initialization
//
//     // if (prefs.getString(PrefKeys.userData) != null) {
//     //   userData = UserModel.fromJson(jsonDecode(prefs.getString(PrefKeys.userData)));
//     //   userId = userData.id;
//     // }
//   }
//
//   // static GoogleSignIn googleSignIn = GoogleSignIn(
//   //   scopes: <String>[
//   //     'email',
//   //     'profile',
//   //   ],
//   // );
//
//   // static setUserData(UserModel userModel) async {
//   //   prefs.setString(PrefKeys.userData, jsonEncode(userModel.toJson()));
//   //   userData = userModel;
//   //   userId = userData.id;
//   // }
//
//   // static getUserData() {
//   //   return UserModel.fromJson(jsonDecode(prefs.getString(PrefKeys.userData)));
//   // }
//
//   static setIsSplashIntroRead(bool isRead) async {
//     storage.write(PrefKeys.isSplashIntroRead, isRead);
//   }
//
//   static getIsSplashIntroRead() async {
//     return storage.read(PrefKeys.isSplashIntroRead);
//   }
//
//   static setIsHealthIntroRead(bool isRead) async {
//     storage.write(PrefKeys.isHealthIntroRead, isRead);
//   }
//
//   static getIsHealthIntroRead() async {
//     return storage.read(PrefKeys.isHealthIntroRead);
//   }
//
//   static setDeviceId(String id) async {
//     storage.write(PrefKeys.deviceId, id);
//   }
//
//   static getDeviceId() async {
//     return storage.read(PrefKeys.deviceId);
//   }
//
//   static setAccessToken(String id) async {
//     storage.write(PrefKeys.deviceId, id);
//   }
//
//   static getAccessToken() async {
//     return storage.read(PrefKeys.deviceId);
//   }
//
//   static setRefreshToken(String id) async {
//     storage.write(PrefKeys.deviceId, id);
//   }
//
//   static getRefreshToken() async {
//     return storage.read(PrefKeys.deviceId);
//   }
// }