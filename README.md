E-commorese 

- code structure
- android,ios,web
- payment inte
- responsive 
- deep link
- push notification
- chat sale up customer
- ui with animation
- with proper route management
- order management
- profile managment
- social login
- clean arcitacter clean code
- payment management
- bloc state management
- cart management local database
- wishilist faverite
- multi language ,hindi, arbic,english
- multi theme
 


BaaS - (backend-as-a-service)

How are they different?#
- Firebase and Supabase differ in several ways. The main one being that Firebase is a
   document store, whereas Supabase is based on PostgreSQL - a relational, SQL-based database management system.

What is AutoRoute?
  - It's a Flutter navigation package, it allows for strongly-typed arguments passing,
     effortless deep-linking and it uses code generation to simplify routes setup

ravina@Techienutz123

Foreign Key Reference:

The foreign key constraints for both inviterId and inviteeId reference auth.users(id).
 This ensures that only valid user IDs from the auth.users table can be inserted into inviterId and inviteeId.
The on delete cascade option ensures that if a user is deleted from
 the auth.users table, all corresponding rows in the invitations table will be deleted automatically. 
This maintains referential integrity.

Firebase (Cloud Firestore):

Firestore is a NoSQL database where data is stored in collections and documents.
Each document represents a single entity (e.g., a message, user, or chat room).
Firestore is optimized for horizontal scaling, which is great for real-time applications like chat.
Supabase (PostgreSQL):

Supabase uses PostgreSQL, which is a relational database that stores data in tables.
A typical structure for chat messages might include tables like users, messages, chats, etc., with foreign keys to establish
 relationships between them.

		
navigation : - navigation system in Flutter is based on a Stack-based model and 
                relies on the Navigator widget. It allows you to push and pop pages on a stack,  that are active

	      - Doesn't scale well with complex routing, deep links, and advanced use cases like nested navigation.


 Navigation 2.0 (Declarative Navigation) : - it's to provide a more flexible, declarative, and structured approach 
			to navigation. It allows for more control over the navigation 
			stack, URL handling, and more fine-grained management of navigation state

navigation when :- When the app is simple, and you don’t need URL-based routing or advanced navigation management.

navigation 2.0 when :- When building complex apps with deep linking, web apps, or when you need more 
			control over navigation logic.


Navigation 2.0 :- (go route)
		handles the high-level app navigation and URL parsing (e.g., handling the URL, deep linking,
		 or route state).

Nested Navigation: - (auto route)
		manages navigation within specific sections (e.g., tabs or a bottom navigation bar), 
		each with its own stack of routes.


1. What is the difference between go Router and Auto_route?
   - go routes does not use code generation.

 go Router : - deep-linking and it uses code generation to simplify routes setup

When to Use AutoRoute: -
	1.When you need type-safe routing with code generation and prefer a more robust, feature-rich solution.
	2.For large, complex apps that require nested navigation and deep linking.

When to Use GoRouter :- 
	1.When building web apps or apps that need URL-based routing
	2.For simpler projects that don’t require the complexity of code generation.
	
Generics provide a way to write flexible, reusable, and type-safe code


Flame is a modular Flutter game engine that provides a complete set of out-of-the-way solutions for games.

foocusNode basically focuses on the keyboard event. add textfield 

deep linking :- Deep linking allows users to be directed to specific content or screens in your app via URLs. 
     		 feature that allows users to access a specific page or action within an app by clicking on a 
                 link from another app or web page 


A tooltip in Flutter is a text label that explains the function of a button or other user interface action.

State is a Data. It is information based on which Flutter will build its UI.

flutter state type 

App State
Ephemeral State

app state type :- 
foground
background
killed 

how many navigator : -
navigator 1.0 : - Navigator.push() and Navigator.pop() 
Navigator 2.0 : - allowing for more control and flexibility, especially in complex apps 
                  like those with deep linking or browser-like routing



{
  "type": "service_account",
  "project_id": "chatapp-4c7b9",
  "private_key_id": "65911cad1ff4f5becbb923c23f79c995b655d771",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQD5jUCLLI8Cmz7c\n6qh1HsO9yudYFjTjOYu9CJsFnDYUaduc1trqzwOw+OpPJ9GCMZILUV204BpEIZ1+\n0JPpGMAHsYSFD/3M3PEhd6kzLO6zkwBuSJ5aUd5pf4CBc6nskXc6rjUxW7wCLbll\nmZ/P+a5Hnc+TrllDX3k6DDv4ugOfVW7gdWSBw8UKpmE/XU54oYTjhZE3tVgd7CIK\nP+lsZNTBNDRPlayTX+SKzcrVn/Vaw/THO6DK8Cwkv37saGVw1D9rOLKmZzwfeHaM\ni+YFCgVrg7H/CG8ymnTYsKI8c48bknTjGTRs9HKuTH9sHABwD0RH+8GnztJb2npR\nY3DByz/LAgMBAAECggEAYxuFfCBUpYDZTOxGvcjbjScljJa5J1rF0+u0gVxiH+ZQ\nqS+tHp7bhO++QnR6YL3mFeeZEwoDdHZzMZeNfn/tV8DY8+1/atp+Sz/WKzRXkmq5\nu5LMjOtBrN1NwFuaqxC0bNId3v3jI2xcWmzSCstKuzeB5lFSMw8aOoL8WFIruR1w\nl/l4xnBc0kQwuXzRbMkLdenTpX5Lto3v/qaY5uNXP+m0zhaF2AyaQUClZRNQWpF+\nH6Loi593pzYMTy1abNEwNojJDVxeteXcaKKpgZ3+HhYtEaacsmagh1TA96rsakRB\n7EDY3XgBvd/5xI6xvueYRYnz3T1aOdEzUb0bbpEq2QKBgQD+0LEDRMSppmxlS5dw\nZ1Fl3sY8Fq5Yv+3/6KaAv5AIu6vVEsSz7g+c73kZyIMm/0nECZEoLwrRNLIHg1aO\nI7tkd0YJgtVa/1nwEhe48kl0mkug6OhHlRAPLzg4vqA5ttj4h5moQodekMyn7rY9\nOg22FErb3FwFUeYHeVs7ymoGqQKBgQD6tkupyGCpC3LrJCUMgtKf2P1/sesYrQ+S\nVizj+eqiyaNpzFsjwA658uPAS2Fvi/lXFZPY3H87mqqd8JSEjmVBEgaP/1DnWpFG\np3iqKV1XH/iSDfNH15QEZYv7dvOPQVvBDhueu4Y7P3hNHsNhk03+BfPa/4MJAXtr\nGUxDgbu/UwKBgDfPWZXPsAtASil9fvO9jVR0kJKEnTcPAn+0YxN74X4oLKCEddS6\n5WyH/swo4KDf9TYcqlBUzVe45O1EVObY6Kg+f3aB010U5IvySoPVfUUurjXWDVnw\nSg4pV3UGO22ooKj+eiciOyf5Kvn1DLEoT+x7UVIKV5VKtMkaSWM1GDfRAoGBAKD0\nS5sSc0vTd9GSAN8JVeMdUZGbTY0n/ak6/dLWbVZZEToo4hIPiOTEFIctXb5ZJJhN\n1/8Pf/dqEkMXYqG/MS4XPnNPvEbrE/1CIutLZws6EUDjB96FfhdcggPMmAzOLvO/\n9OdxCHodA0SvjUulYBrHA4kDJMKxWuSk9xsXvMrVAoGACzsfe4ubgmqESclNUbuA\nX9IsMJLIXJOD6oihxOaPXzUSwtayr4yYD0qH5wR63uPyCXKo4nSQMV+0QQR+stt5\nWU9c/ucWjp7ra3VScpzOKKOHDhOAM67dOoRnxY1L0jUDGNXeli1vzwCnlVUIQ8bR\n7SWBpVQprWvWhXuJDJibpsk=\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-2s49k@chatapp-4c7b9.iam.gserviceaccount.com",
  "client_id": "109487600773801532875",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-2s49k%40chatapp-4c7b9.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

{
 "iss": "firebase-adminsdk-2s49k@chatapp-4c7b9.iam.gserviceaccount.com",
  "scope": "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/firebase.database https://www.googleapis.com/auth/firebase.messaging",
  "aud": "https://oauth2.googleapis.com/token",
  "exp": "1735722877",
  "iat": "1735636477"
}


-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQD5jUCLLI8Cmz7c
6qh1HsO9yudYFjTjOYu9CJsFnDYUaduc1trqzwOw+OpPJ9GCMZILUV204BpEIZ1+
0JPpGMAHsYSFD/3M3PEhd6kzLO6zkwBuSJ5aUd5pf4CBc6nskXc6rjUxW7wCLbll
mZ/P+a5Hnc+TrllDX3k6DDv4ugOfVW7gdWSBw8UKpmE/XU54oYTjhZE3tVgd7CIK
P+lsZNTBNDRPlayTX+SKzcrVn/Vaw/THO6DK8Cwkv37saGVw1D9rOLKmZzwfeHaM
i+YFCgVrg7H/CG8ymnTYsKI8c48bknTjGTRs9HKuTH9sHABwD0RH+8GnztJb2npR
Y3DByz/LAgMBAAECggEAYxuFfCBUpYDZTOxGvcjbjScljJa5J1rF0+u0gVxiH+ZQ
qS+tHp7bhO++QnR6YL3mFeeZEwoDdHZzMZeNfn/tV8DY8+1/atp+Sz/WKzRXkmq5
u5LMjOtBrN1NwFuaqxC0bNId3v3jI2xcWmzSCstKuzeB5lFSMw8aOoL8WFIruR1w
l/l4xnBc0kQwuXzRbMkLdenTpX5Lto3v/qaY5uNXP+m0zhaF2AyaQUClZRNQWpF+
H6Loi593pzYMTy1abNEwNojJDVxeteXcaKKpgZ3+HhYtEaacsmagh1TA96rsakRB
7EDY3XgBvd/5xI6xvueYRYnz3T1aOdEzUb0bbpEq2QKBgQD+0LEDRMSppmxlS5dw
Z1Fl3sY8Fq5Yv+3/6KaAv5AIu6vVEsSz7g+c73kZyIMm/0nECZEoLwrRNLIHg1aO
I7tkd0YJgtVa/1nwEhe48kl0mkug6OhHlRAPLzg4vqA5ttj4h5moQodekMyn7rY9
Og22FErb3FwFUeYHeVs7ymoGqQKBgQD6tkupyGCpC3LrJCUMgtKf2P1/sesYrQ+S
Vizj+eqiyaNpzFsjwA658uPAS2Fvi/lXFZPY3H87mqqd8JSEjmVBEgaP/1DnWpFG
p3iqKV1XH/iSDfNH15QEZYv7dvOPQVvBDhueu4Y7P3hNHsNhk03+BfPa/4MJAXtr
GUxDgbu/UwKBgDfPWZXPsAtASil9fvO9jVR0kJKEnTcPAn+0YxN74X4oLKCEddS6
5WyH/swo4KDf9TYcqlBUzVe45O1EVObY6Kg+f3aB010U5IvySoPVfUUurjXWDVnw
Sg4pV3UGO22ooKj+eiciOyf5Kvn1DLEoT+x7UVIKV5VKtMkaSWM1GDfRAoGBAKD0
S5sSc0vTd9GSAN8JVeMdUZGbTY0n/ak6/dLWbVZZEToo4hIPiOTEFIctXb5ZJJhN
1/8Pf/dqEkMXYqG/MS4XPnNPvEbrE/1CIutLZws6EUDjB96FfhdcggPMmAzOLvO/
9OdxCHodA0SvjUulYBrHA4kDJMKxWuSk9xsXvMrVAoGACzsfe4ubgmqESclNUbuA
X9IsMJLIXJOD6oihxOaPXzUSwtayr4yYD0qH5wR63uPyCXKo4nSQMV+0QQR+stt5
WU9c/ucWjp7ra3VScpzOKKOHDhOAM67dOoRnxY1L0jUDGNXeli1vzwCnlVUIQ8bR
7SWBpVQprWvWhXuJDJibpsk=
-----END PRIVATE KEY-----


import 'package:chat_app/bloc_observer.dart';
import 'package:chat_app/screen/all_chats_flow/view/chatlist_page.dart';
import 'package:chat_app/screen/auth_flow/login_flow/bloc/login_bloc.dart';
import 'package:chat_app/screen/auth_flow/login_flow/view/login_page.dart';
import 'package:chat_app/screen/auth_flow/signup_flow/bloc/signup_bloc.dart';
import 'package:chat_app/screen/auth_flow/signup_flow/view/signup_page.dart';
import 'package:chat_app/screen/chat_flow/view/chat_page.dart';
import 'package:chat_app/screen/group/select_users_page.dart';
import 'package:chat_app/screen/invitation_flow/view/invitation_page.dart';
import 'package:chat_app/screen/list_user_flow/view/loginuser_page.dart';
import 'package:chat_app/screen/splash_flow/view/splash_page.dart';
import 'package:chat_app/services/firebase_services.dart';
import 'package:chat_app/services/notification_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';
import 'package:chat_app/screen/chat_flow/bloc/chat_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await PushNotifications.initNotifications();

  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    await PushNotifications.getFirebaseMessagingToken(userId: currentUser.uid);
  }

  await FirebaseMessaging.instance.requestPermission();

  void handleNotificationTapFromTerminatedState(RemoteMessage message) {
    if (message.data['chatId'] != null) {
      print("Notification tapped while app terminated: ${message.data}");
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) => ChatPage(chatId: message.data['chatId']),
        ),
      );
    } else {
      print("Chat ID is null in notification data.");
    }
  }

  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null && message.data.containsKey('chatId')) {
      final chatId = message.data['chatId'];
      print("App launched from terminated state with chatId: $chatId");

      FirebaseFirestore.instance
          .collection('chats')
          .doc(chatId)
          .get()
          .then((chatDoc) {
        if (chatDoc.exists) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            navigatorKey.currentState?.push(
              MaterialPageRoute(
                builder: (context) => ChatPage(chatId: chatId),
              ),
            );
          });
        } else {
          print("Chat document not found for chatId: $chatId");
        }
      }).catchError((error) {
        print("Error fetching chat document: $error");
      });
    } else {
      print("Notification does not contain a valid chatId.");
    }
  });

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  WidgetsBinding.instance.addPostFrameCallback((_) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  });

  SystemChannels.lifecycle.setMessageHandler((msg) async {
    if (msg == AppLifecycleState.resumed.toString()) {
      await FirebaseHelper.firebaseHelper.updateUserOnlineStatus(true);
    } else if (msg == AppLifecycleState.paused.toString() ||
        msg == AppLifecycleState.detached.toString() ||
        msg == AppLifecycleState.inactive.toString()) {
      await FirebaseHelper.firebaseHelper.updateUserOnlineStatus(false);
    }
    return null;
  });

  Bloc.observer = ChatObserver();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (p0, p1, p2) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
            BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
            BlocProvider<ChatBloc>(create: (context) => ChatBloc()),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const SplashScreen(),
              'signUp': (context) => const SignupPage(),
              'login': (context) => const LogInPage(),
              'home': (context) => const ChatListPage(),
              'user': (context) => const LoginUserPage(),
              'notification': (context) => const InvitationPage(),
              'groupSelect': (context) => const SelectUsersPage(),
            },
          ),
        );
      },
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

class ChatObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('Event****: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('Transition: $transition');
  }
}
import 'dart:convert';
import 'package:chat_app/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screen/chat_flow/view/chat_page.dart';

class PushNotifications {
  static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin localNotifications = FlutterLocalNotificationsPlugin();

  static Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await localNotifications.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
      onDidReceiveNotificationResponse: (details) {
        handleNotificationTap(details);
      },
    );

    await createNotificationChannel();

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen(handleForegroundMessage);

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleNotificationTap(NotificationResponse(
        notificationResponseType: NotificationResponseType.selectedNotification,
        payload: createPayload(message),
      ));
    });
  }

  static Future<void> createNotificationChannel() async {
    const channel = AndroidNotificationChannel(
      'chat_messages',
      'Chat Messages',
      description: 'Notifications for new chat messages',
      importance: Importance.high,
      enableVibration: true,
      playSound: true,
      enableLights: true,
      ledColor: Colors.blue,
      showBadge: true,
    );

    await localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static Future<void> getFirebaseMessagingToken({required String userId}) async {
    try {
      final token = await firebaseMessaging.getToken();
      if (token != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'pushToken': token,
          'lastTokenUpdate': FieldValue.serverTimestamp(),
        });
        print('FCM Token stored for user $userId: $token');
      }
    } catch (e) {
      print('Error getting/storing FCM token: $e');
    }
  }

  static Future<void> handleForegroundMessage(RemoteMessage message) async {
    print('Handling foreground message: ${message.messageId}');
    await showNotification(message);
  }

  static String createPayload(RemoteMessage message) {
    return jsonEncode({
      'chatId': message.data['chatId'],
      'senderId': message.data['senderId'],
      'type': message.data['type'],
      'timestamp': message.data['timestamp'],
    });
  }

  static void handleNotificationTap(NotificationResponse details) {
    if (details.payload != null) {
      try {
        final payloadStr = details.payload!;
        final payload = Map<String, dynamic>.from(jsonDecode(payloadStr));
        if (payload['chatId'] != null) {
          print("ooooooooooooooooooooooooooooooooooooo11111111111111111111");

          navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (context) => ChatPage(chatId: payload['chatId']),
            ),
          );

        } else {
          print('No chatId found in the payload');
        }
      } catch (e) {
        print('Error handling notification tap: $e');
      }
    }
  }


  static Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    String messageType = message.data['type'] ?? 'chat_message';

    if (notification != null) {
      String timeString = DateFormat('HH:mm').format(DateTime.now());
      String senderName = message.data['senderName'] ?? 'Someone';

      if (messageType == 'invitation') {
        await localNotifications.show(
          notification.hashCode,
          'New Chat Invitation',
          '$senderName wants to chat with you',
          NotificationDetails(
            android: AndroidNotificationDetails(
              'chat_invitations',
              'Chat Invitations',
              channelDescription: 'Notifications for chat invitations',
              importance: Importance.high,
              priority: Priority.high,
              showWhen: true,
              when: DateTime.now().millisecondsSinceEpoch,
              enableVibration: true,
              playSound: true,
              largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
              color: Colors.blue,
              subText: timeString,
              category: AndroidNotificationCategory.social,
              visibility: NotificationVisibility.public,
            ),
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              subtitle: timeString,
              threadIdentifier: 'invitations',
            ),
          ),
          payload: createPayload(message),
        );
      } else {
        await localNotifications.show(
          notification.hashCode,
          'New Chat',
          '$senderName sent a chat',
          NotificationDetails(
            android: AndroidNotificationDetails(
              'chat',
              'Chat',
              channelDescription: 'Notifications for chat messages',
              importance: Importance.high,
              priority: Priority.high,
              showWhen: true,
              when: DateTime.now().millisecondsSinceEpoch,
              enableVibration: true,
              playSound: true,
              largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
              color: Colors.blue,
              subText: timeString,
              category: AndroidNotificationCategory.social,
              visibility: NotificationVisibility.public,
            ),
            iOS: DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              subtitle: timeString,
              threadIdentifier: 'message',
            ),
          ),
          payload: createPayload(message),
        );
      }
    }
  }
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling background message: ${message.messageId}');
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../screen/chat_flow/data/model.dart';
import 'notification_services.dart';

class FirebaseHelper {
  static final FirebaseHelper firebaseHelper = FirebaseHelper._internal();
  FirebaseHelper._internal();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<String> signInAnonymously() async {
    try {
      await auth.signInAnonymously();
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> createAccount(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signInWithEmailPassword(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<UserCredential> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleUser == null || googleAuth == null) {
        throw 'Google sign-in failed';
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await auth.signInWithCredential(credential);

      await saveGoogleUserData(userCredential.user!);

      await PushNotifications.getFirebaseMessagingToken(
          userId: userCredential.user!.uid);

      return userCredential;
    } catch (e) {
      throw 'Error during Google sign-in: $e';
    }
  }

  Future<String> createChat(String otherUserId) async {
    String currentUserId = auth.currentUser!.uid;
    String chatId = generateChatId(currentUserId, otherUserId);

    if (chatId.isEmpty) {
      throw 'Chat ID cannot be empty';
    }
    await firebaseFirestore.collection('chats').doc(chatId).set({
      'users': [currentUserId, otherUserId],
      'isGroup': false,
      'lastMessage': 'Chat started!',
      'lastMessageTime': FieldValue.serverTimestamp(),
      'unreadCount': {
        currentUserId: 0,
        otherUserId: 0,
      },
      'typing': {
        currentUserId: false,
        otherUserId: false,
      },
    });

    await firebaseFirestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
      'senderId': currentUserId,
      'message': 'Chat started!',
      'timestamp': FieldValue.serverTimestamp(),
      'type': 'system',
    });

    return chatId;
  }

  String generateChatId(String user1, String user2) {
    List<String> users = [user1, user2]..sort();
    return users.join('_');
  }

  bool checkUser() {
    User? user = auth.currentUser;
    return user != null;
  }

  Future<void> userLogout() async {
    try {
      final user = auth.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'isOnline': false,
          'lastSeen': FieldValue.serverTimestamp(),
        });
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update({
        'pushToken': null,
      });

      await auth.signOut();
      await GoogleSignIn().signOut();
    } catch (e) {
      debugPrint('Error during logout: $e');
    }
  }

  // Future<String> uploadProfileImage(File profileImage) async {
  //   try {
  //     String fileName = 'profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg';
  //     UploadTask uploadTask = storage.ref(fileName).putFile(profileImage);
  //     TaskSnapshot snapshot = await uploadTask;
  //     String downloadUrl = await snapshot.ref.getDownloadURL();
  //     return downloadUrl;
  //   } catch (e) {
  //     return '';
  //   }
  // }

  Future<void> saveGoogleUserData(User user) async {
    try {
      String username = user.displayName ?? 'Anonymous';
      String email = user.email ?? '';
      String profileImageUrl = user.photoURL ?? '';

      var userDoc =
          await firebaseFirestore.collection('users').doc(user.uid).get();

      if (!userDoc.exists) {
        await firebaseFirestore.collection('users').doc(user.uid).set({
          'username': username,
          'email': email,
          'profileImage': profileImageUrl,
          'createdAt': FieldValue.serverTimestamp(),
        });

        await PushNotifications.getFirebaseMessagingToken(userId: user.uid);
      }
    } catch (e) {
      throw 'Error saving user data to Firestore: $e';
    }
  }

  Future<void> saveUserData(
      String userId, String username, String email) async {
    try {
      await firebaseFirestore.collection('users').doc(userId).set({
        'username': username,
        'email': email,
        // 'profileImage': profileImageUrl,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> checkUserExists(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await firebaseFirestore.collection('users').doc(uid).get();
      return userDoc.exists;
    } catch (e) {
      print('Error checking user in Firestore: $e');
      return false;
    }
  }

  Future<List<DocumentSnapshot>> getUsers() async {
    try {
      QuerySnapshot snapshot =
          await firebaseFirestore.collection('users').get();
      return snapshot.docs;
    } catch (e) {
      throw 'Error fetching users: $e';
    }
  }

  Stream<QuerySnapshot> getChatsStream() {
    final currentUser = auth.currentUser;
    if (currentUser == null) throw 'User not authenticated';

    return firebaseFirestore
        .collection('chats')
        .where('users', arrayContains: currentUser.uid)
        .snapshots();
  }

  Future<DocumentSnapshot> getUserData(String userId) async {
    try {
      return await firebaseFirestore.collection('users').doc(userId).get();
    } catch (e) {
      throw 'Error getting user data: $e';
    }
  }

  Future<String> getChatName(String chatId, String currentUserId) async {
    try {
      final chatDoc =
          await firebaseFirestore.collection('chats').doc(chatId).get();
      if (!chatDoc.exists) throw 'Chat not found';

      final chatData = chatDoc.data() as Map<String, dynamic>;
      final bool isGroup = chatData['isGroup'] ?? false;

      if (isGroup) {
        return chatData['groupName'] ?? 'Unnamed Group';
      } else {
        List<String> users = List<String>.from(chatData['users']);
        String otherUserId = users.firstWhere(
          (userId) => userId != currentUserId,
          orElse: () => '',
        );

        if (otherUserId.isEmpty) return 'Unknown User';

        final userDoc = await getUserData(otherUserId);
        return userDoc.get('username') ?? 'Unknown User';
      }
    } catch (e) {
      throw 'Error getting chat name: $e';
    }
  }

  Future<void> deleteUserAccount(String uid) async {
    try {
      User? user = auth.currentUser;
      print("zzzzzzzzzzzzzzzzzzzzzzzzz${user}");
      if (user != null && user.uid == uid) {
        print("zzzzzzzzzzzzzzzzzzzzzzzzz11${user}");
        await user.delete().then(
          (value) {
            print("ccccccccccccccc${user}");
          },
        );
      }
    } catch (e) {
      throw "Error deleting user account.";
    }
  }

  Future<void> sendChatInvite(
      String inviterId, String inviteeId, String message) async {
    try {
      QuerySnapshot userInvite = await firebaseFirestore
          .collection('invitations')
          .where('inviteeId', isEqualTo: inviteeId)
          .where('inviterId', isEqualTo: inviterId)
          .limit(1)
          .get();

      if (userInvite.docs.isNotEmpty) {
        throw Exception('An invitation has already been sent to this user.');
      }

      final inviterDoc = await getUserData(inviterId);
      final inviterName = inviterDoc.get('username') ?? 'Someone';

      final inviteeDoc = await getUserData(inviteeId);
       String? inviteeToken = inviteeDoc.get('pushToken');

      await firebaseFirestore.collection('invitations').add({
        'inviterId': inviterId,
        'inviteeId': inviteeId,
        'message': message,
        'status': 'pending',
        'inviteTime': FieldValue.serverTimestamp(),
      });
      inviteeToken = 'dZMU-LHcSku1_FvL_6QYTs:APA91bHS62EEC-56dMj7K9J3sp5Z5PXIV9HPz--F-PV86E92u7fBHUNcBtRPA9MtpAt_uWfLZgPC6igc4m0e_B3rL1AFavFxPbvUeUMzMNR-VZ1AdltzOtI';
      // if (inviteeToken != null) {
        await sendFCMNotification(
          token: inviteeToken,
          title: 'New Chat Invitation',
          body: '$inviterName wants to chat with you',
          data: {
            'type': 'invitation',
            'inviterId': inviterId,
            'senderName': inviterName,
            'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
          },
        );
      // }
    } catch (e) {
      throw Exception("Error sending chat invite: $e");
    }
  }

  Stream<Map<String, dynamic>> checkInviteStatus(String userId) {
    try {
      return firebaseFirestore
          .collection('invitations')
          .where('inviterId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where('inviteeId', isEqualTo: userId)
          .where('status', whereIn: ['pending', 'declined', 'accepted'])
          .limit(1)
          .snapshots()
          .map((snapshot) {
            if (snapshot.docs.isNotEmpty) {
              var status = snapshot.docs.first['status'];
              return {
                'pending': status == 'pending',
                'declined': status == 'declined',
                'accepted': status == 'accepted',
              };
            } else {
              return {'pending': false, 'declined': false, 'accepted': false};
            }
          });
    } catch (e) {
      throw Exception("Error checking invite status: $e");
    }
  }

  Future<bool> isUserInChat(String currentUserId, String selectedUserId) async {
    try {
      var chatUser = FirebaseFirestore.instance.collection('chats');
      var querySnapshot = await chatUser.where('users',
          arrayContainsAny: [currentUserId, selectedUserId]).get();

      return querySnapshot.docs.any((doc) {
        var users = List<String>.from(doc['users']);
        return users.contains(currentUserId) && users.contains(selectedUserId);
      });
    } catch (e) {
      print("Error checking chat status: $e");
      return false;
    }
  }

  Future<String> createGroupChat(
      String groupName, List<String> selectedUsers) async {
    try {
      String currentUserId = auth.currentUser!.uid;

      if (selectedUsers.isEmpty ||
          (selectedUsers.length == 1 && selectedUsers.first == currentUserId)) {
        throw 'Please select at least one other user for the group';
      }

      if (!selectedUsers.contains(currentUserId)) {
        selectedUsers.add(currentUserId);
      }

      QuerySnapshot existingGroups = await firebaseFirestore
          .collection('chats')
          .where('isGroup', isEqualTo: true)
          .get();

      for (var doc in existingGroups.docs) {
        List<String> users = List<String>.from(doc['users'] ?? []);
        if (users.length == selectedUsers.length &&
            users.every((user) => selectedUsers.contains(user))) {
          throw 'A group with these exact members already exists';
        }
      }

      DocumentReference chatRef =
          await firebaseFirestore.collection('chats').add({
        'users': selectedUsers,
        'isGroup': true,
        'groupName': groupName,
        'createdBy': currentUserId,
        'createdAt': FieldValue.serverTimestamp(),
        'lastMessage': 'Group created',
        'lastMessageTime': FieldValue.serverTimestamp(),
        'unreadCount': {for (var user in selectedUsers) user: 0},
      });

      await chatRef.collection('messages').add({
        'senderId': currentUserId,
        'message': 'Group created',
        'timestamp': FieldValue.serverTimestamp(),
        'type': 'system',
      });

      for (String userId in selectedUsers) {
        if (userId != currentUserId) {
          await firebaseFirestore.collection('users').doc(userId).update({
            'unreadCount': FieldValue.increment(1),
          });
        }
      }

      return chatRef.id;
    } catch (e) {
      throw 'Error creating group chat: $e';
    }
  }

  Future<void> sendMessage(String chatId, String message) async {
    try {
      final currentUser = auth.currentUser;
      if (currentUser == null) return;

      final chatDoc =
          await firebaseFirestore.collection('chats').doc(chatId).get();
      if (!chatDoc.exists) return;

      final List<String> users =
          List<String>.from(chatDoc.data()?['users'] ?? []);
      final bool isGroup = chatDoc.data()?['isGroup'] ?? false;

      final senderDoc = await getUserData(currentUser.uid);
      final senderName = senderDoc.get('username') ?? 'Unknown User';

      await firebaseFirestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .add({
        'senderId': currentUser.uid,
        'message': message,
        'timestamp': FieldValue.serverTimestamp(),
        'type': 'text',
      });

      await firebaseFirestore.collection('chats').doc(chatId).update({
        'lastMessage': message,
        'lastMessageTime': FieldValue.serverTimestamp(),
      });

      for (String userId in users) {
        if (userId != currentUser.uid) {
          final userDoc = await getUserData(userId);
           String? pushToken = userDoc.get('pushToken');
          print("token show 111111111111111111${pushToken}");
          pushToken = "dZMU-LHcSku1_FvL_6QYTs:APA91bHS62EEC-56dMj7K9J3sp5Z5PXIV9HPz--F-PV86E92u7fBHUNcBtRPA9MtpAt_uWfLZgPC6igc4m0e_B3rL1AFavFxPbvUeUMzMNR-VZ1AdltzOtI";
          if (pushToken != null) {
            await sendFCMNotification(
              token: pushToken,
              title: isGroup ? chatDoc.get('groupName') : senderName,
              body: message,
              data: {
                'chatId': chatId,
                'senderId': currentUser.uid,
                'senderName': senderName,
                'type': 'chat_message',
                'isGroup': isGroup.toString(),
                'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
              },
            );
          }
        }
      }
      await updateUnreadCount(chatId, currentUser.uid);
    } catch (e) {
      throw 'Error sending message: $e';
    }
  }

  Future<void> sendFCMNotification({
    required String token,
    required String title,
    required String body,
    required Map<String, String> data,
  }) async {
    try {
      print("Called ************************************");
      final response = await http.post(
        Uri.parse('https://fcm.googleapis.com/v1/projects/chatapp-4c7b9/messages:send'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ya29.c.c0ASRK0GbxduaCCosYaMncmKGyNwt36JX9jnM3VzONS1xIn5hveL-JA01ExvfbpfVLUpoxGA77AY4fJ_WD8ZBBYwmZ-m5NKjnZOITUGQMFf5r-48BGOhUse0SSGt94niOrvqKZ5hWWbrTPi2CpIAYTbeJLYoWnkuQ0Oqy8JdjMUg5eA6Bx8WQcC_hOngq_2ATbc9VM066bp2PQcIcPoumuqbYPXyGjH4Q9O6y6iB4DbRLhWmi0fwWCwxal8UYIh8e_O-pw5mFPUEzrG242Jxc28yNA2WUHkeednTtLvau5bgIq0jnmmWhHlqavznLVtpM5NNnpTYjVG4DTO2Qr5-A1Betm9lYZ87-CTcf8PewlrtKnd9-Av5FHUgXhtXOtL389P5effnyoaxj-006yciSY1IbU7lWbqYbs7WVqiurnqgvt0npnoyO869BV2ncoOgbF2mgfdxbjnFqy-BWcdbac3p-Wy17zyUxnjsOVZMy7rqdBhrBUmJb1X-b9wZRoQqlYIXdf56lWXfoia_QchVt7be_VtwrdrQ8uJn686RxZgpRbmonUx3SV2fjvMSMYJjlWRojfjixMjj9ZjiZ_pcyWiVY3pxfpy_4IjMac8JJsaa7R_ubwUwJZbqSYoq8FtJZOYV-dV74gQ1x8khUQcosbFYiFV9ogRegUZgbXya9O_Qi9s3B8ap2uw4QwJoR4Ovp0_lgi_99MaXBl8u4Ffo0IQk5s__qq7XtMISea6tSxZrxQ6qB5ee9s_0R-p-qJhUX2cO0rYel225vapnJZlVJdv3OVYY7nMubjO-Sm-B5n2aVV6JYMcqXarQMis51VU4SayUkFB2x_xj651aWj1BIx9fJYX0g28slrUYRtrF-MYt77Jtg2Qjy56JeWowp6dBfOqWpFX5Iphss2h5a3ZZ7kyzZJXh892usF29va2uW4zn92XpjQStp6lBaa8iRdbsuf15VQB6fnXmok90ijuSk-isMnoV94bfutswhjU1-F-dxhqyO2Z1-UOQt',
        },
        body: jsonEncode({
          'message': {
            'notification': {'title': title, 'body': body},
            'token': 'dZMU-LHcSku1_FvL_6QYTs:APA91bHS62EEC-56dMj7K9J3sp5Z5PXIV9HPz--F-PV86E92u7fBHUNcBtRPA9MtpAt_uWfLZgPC6igc4m0e_B3rL1AFavFxPbvUeUMzMNR-VZ1AdltzOtI',
            'data': data
          }
        }),
      );

      print('FCM Response: ${response.body}');
    } catch (e) {
      print('Error sending FCM notification: $e');
    }
  }

  Future<void> updateUnreadCount(String chatId, String senderId) async {
    try {
      final chatDoc =
          await firebaseFirestore.collection('chats').doc(chatId).get();
      if (!chatDoc.exists) return;

      Map<String, dynamic> unreadCount =
          Map<String, dynamic>.from(chatDoc.data()?['unreadCount'] ?? {});

      List<String> users = List<String>.from(chatDoc.data()?['users'] ?? []);

      for (String userId in users) {
        if (userId != senderId) {
          unreadCount[userId] = (unreadCount[userId] ?? 0) + 1;
        }
      }

      await firebaseFirestore.collection('chats').doc(chatId).update({
        'unreadCount': unreadCount,
      });
    } catch (e) {
      print('Error updating unread count: $e');
    }
  }

  Future<void> resetUnreadCount(String chatId) async {
    try {
      final currentUser = auth.currentUser;
      if (currentUser == null) return;

      final chatDoc =
          await firebaseFirestore.collection('chats').doc(chatId).get();
      if (!chatDoc.exists) return;

      Map<String, dynamic> unreadCount =
          Map<String, dynamic>.from(chatDoc.data()?['unreadCount'] ?? {});

      unreadCount[currentUser.uid] = 0;

      await firebaseFirestore.collection('chats').doc(chatId).update({
        'unreadCount': unreadCount,
      });
    } catch (e) {
      print('Error resetting unread count: $e');
    }
  }

  Future<void> updateUserOnlineStatus(bool isOnline) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'isOnline': isOnline,
          'lastSeen': FieldValue.serverTimestamp(),
        });
      }
    } catch (e) {
      debugPrint('Error updating online status: $e');
    }
  }

  Future<void> setupPresence() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final userStatusRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    await userStatusRef.update({
      'isOnline': true,
      'lastSeen': FieldValue.serverTimestamp(),
    });
  }

  Stream<DocumentSnapshot> getUserOnlineStatus(String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots();
  }

  Future<void> setTypingStatus(String chatId, bool isTyping) async {
    try {
      final user = auth.currentUser;
      if (user == null) return;

      await firebaseFirestore.collection('chats').doc(chatId).update({
        'typing.${user.uid}': isTyping,
      });
    } catch (e) {
      debugPrint('Error updating typing status: $e');
    }
  }

  Stream<DocumentSnapshot> getTypingStatus(String chatId) {
    return firebaseFirestore.collection('chats').doc(chatId).snapshots();
  }

  Future<void> toggleReaction(String chatId, String messageId, String userId, String reaction) async {
    try {
      final messageRef = firebaseFirestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .doc(messageId);

      final messageDoc = await messageRef.get();
      Map<String, String> reactions = Map<String, String>.from(messageDoc.data()?['reactions'] ?? {});

      if (reactions[userId] == reaction) {
        reactions.remove(userId);
      } else {
        reactions[userId] = reaction;
      }

      await messageRef.update({'reactions': reactions});
    } catch (e) {
      throw 'Error toggling reaction: $e';
    }
  }

  Future<void> deleteMessages(String chatId, List<Message> messages, String userId) async {
    try {
      final batch = firebaseFirestore.batch();
      
      for (final message in messages) {
        if (message.senderId == userId) {
          final messageRef = firebaseFirestore
              .collection('chats')
              .doc(chatId)
              .collection('messages')
              .doc(message.id);
          batch.delete(messageRef);
        }
      }

      await batch.commit();
    } catch (e) {
      throw 'Error deleting messages: $e';
    }
  }

  Future<void> editMessage(String chatId, String messageId, String newMessage) async {
    try {
      final messageRef = firebaseFirestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .doc(messageId);

      await messageRef.update({
        'message': newMessage,
        'isEdited': true,
      });

      final chatDoc = await firebaseFirestore.collection('chats').doc(chatId).get();
      if (chatDoc.data()?['lastMessage'] == messageId) {
        await firebaseFirestore.collection('chats').doc(chatId).update({
          'lastMessage': newMessage,
        });
      }
    } catch (e) {
      throw 'Error editing message: $e';
    }
  }

  Future<void> toggleMessagePin(String chatId, String messageId, bool isPinned) async {
    try {
      final messageRef = firebaseFirestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .doc(messageId);

      await messageRef.update({'isPinned': isPinned});
    } catch (e) {
      throw 'Error toggling pin: $e';
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../generated/assets.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashStartEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              if (state is SplashLoadedState) {
                if (state.isLoggedIn) {
                  Navigator.pushReplacementNamed(context, 'home');
                } else {
                  Navigator.pushReplacementNamed(context, 'login');
                }
              } else if (state is SplashErrorState) {
                Navigator.pushReplacementNamed(context, 'signUp');
              }
            },
            child: Image.asset(
              Assets.imagesSplash,
              height: 20.h,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/firebase_services.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashStartEvent>((event, emit) async {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        bool userExists =
            await FirebaseHelper.firebaseHelper.checkUserExists(user.uid);

        if (userExists) {
          emit(SplashLoadedState(isLoggedIn: true));
        } else {
          emit(SplashErrorState( "User Token Expired. Please complete your registration."));
          await FirebaseHelper.firebaseHelper.deleteUserAccount(user.uid);
        }
      } else {
        emit(SplashLoadedState(isLoggedIn: false));
      }

      await Future.delayed(const Duration(seconds: 3));
    });
  }
}
import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {}

class SplashStartEvent extends SplashEvent {
  @override
  List<Object?> get props => [];
}
import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {}

class SplashInitialState extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashLoadedState extends SplashState {
  final bool isLoggedIn;

  SplashLoadedState({required this.isLoggedIn});

  @override
  List<Object?> get props => [];
}

class SplashErrorState extends SplashState {
  final String message;

  SplashErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/assets.dart';
import '../../../services/firebase_services.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../bloc/user_state.dart';

class LoginUserPage extends StatelessWidget {
  const LoginUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
            child: const Text('Please log in'),
          ),
        ),
      );
    }
    return BlocProvider(
      create: (context) =>
          UserBloc(firebaseHelper: FirebaseHelper.firebaseHelper)
            ..add(FetchUsersEvent()),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            backgroundColor: Colors.grey[300],
            title: const Text('Invite Chat Users'),
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UserErrorState) {
                return Center(child: Text(state.error));
              } else if (state is UserLoadedState) {
                var users = state.users;
                users = users.where((userDoc) {
                  String userId = userDoc.id;
                  return userId != FirebaseAuth.instance.currentUser?.uid;
                }).toList();
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      var userData = users[index].data() as Map<String, dynamic>;
                      String username = userData['username'] ?? 'No name';
                      String email = userData['email'] ?? 'No email';
                      String profileImage = userData['profileImage'] ?? '';
                      String userId = users[index].id;

                      return BlocProvider(
                        create: (context) => UserBloc(firebaseHelper: FirebaseHelper.firebaseHelper),
                        child: UserInviteCard(
                          userId: userId,
                          username: username,
                          email: email,
                          profileImage: profileImage,
                        ),
                      );

                    },
                  ),
                );
              } else {
                return const Center(child: Text('No users found.'));
              }
            },
          ),
        ),
      ),
    );
  }
}

class UserInviteCard extends StatelessWidget {
  final String userId;
  final String username;
  final String email;
  final String profileImage;

  const UserInviteCard({
    super.key,
    required this.userId,
    required this.username,
    required this.email,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(firebaseHelper: FirebaseHelper.firebaseHelper),
      child: StreamBuilder<Map<String, dynamic>>(
        stream: FirebaseHelper.firebaseHelper.checkInviteStatus(userId),
        builder: (context, statusSnapshot) {
          if (statusSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (statusSnapshot.hasError) {
            return Center(child: Text(statusSnapshot.error.toString()));
          } else if (statusSnapshot.hasData) {
            var status = statusSnapshot.data!;
            bool isPending = status['pending'];
            bool isDeclined = status['declined'];
            bool isAccepted = status['accepted'];
            
            print("cccccccccccc222222222$isPending");

            print("user id ${FirebaseAuth.instance.currentUser!.uid}");
            print("inviteeId111111111111111 $userId");

            return FutureBuilder<bool>(
              future: FirebaseHelper.firebaseHelper
                  .isUserInChat(FirebaseAuth.instance.currentUser!.uid, userId),
              builder: (context, chatSnapshot) {
                if (chatSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                bool isInChat = chatSnapshot.data ?? false;

                return Card(
                  color: Colors.grey[100],
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: profileImage.isNotEmpty
                          ? NetworkImage(profileImage)
                          : const AssetImage(Assets.imagesProfile)
                              as ImageProvider,
                      radius: 25,
                    ),
                    title: Text(username),
                    subtitle: Text(email),
                    trailing: isInChat
                        ? InkWell(onTap: () {
                          Navigator.pop(context);
                        },
                          child: const Text(
                              "Already in chat",
                              style: TextStyle(color: Colors.blue),
                            ),
                        )
                        : isPending
                            ? const Text(
                                "Pending",
                                style: TextStyle(color: Colors.orange),
                              )
                            : isDeclined
                                ? const Text(
                                    "Declined",
                                    style: TextStyle(color: Colors.redAccent),
                                  )
                                : isAccepted
                                    ? const Text(
                                        "Accepted",
                                        style: TextStyle(color: Colors.green),
                                      )
                                    : IconButton(
                                        icon: const Icon(Icons.message),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return AlertDialog(
                                                backgroundColor: Colors.white,
                                                title:
                                                    const Text('Chat Invite'),
                                                content: const Text(
                                                    'Do you want to invite this user to chat?'),
                                                actions: [
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                        backgroundColor: Colors
                                                            .grey.shade200),
                                                    onPressed: () {
                                                      Navigator.of(dialogContext).pop();
                                                    },
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: isInChat
                                                        ? null
                                                        : () {
                                                            BlocProvider.of<
                                                                        UserBloc>(
                                                                    context)
                                                                .add(
                                                              SendChatInviteEvent(
                                                                currentUserId:
                                                                    FirebaseAuth
                                                                        .instance
                                                                        .currentUser!
                                                                        .uid,
                                                                selectedUserId:
                                                                    userId,
                                                                inviteMessage:
                                                                    "Hey, let's chat!",
                                                              ),
                                                            );
                                                            Navigator.of(
                                                                    dialogContext)
                                                                .pop();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              const SnackBar(
                                                                content: Text(
                                                                    'Invite sent!'),
                                                              ),
                                                            );
                                                          },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.black),
                                                    child: const Text(
                                                     'Send Invite',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/firebase_services.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FirebaseHelper firebaseHelper;

  UserBloc({required this.firebaseHelper}) : super(UserLoadingState()) {
    on<FetchUsersEvent>(onFetchUsersEvent);
    on<SendChatInviteEvent>(onSendChatInviteEvent);
  }

  Future<void> onFetchUsersEvent(
      FetchUsersEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState());
      var users = await firebaseHelper.getUsers();
      emit(UserLoadedState(users));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  Future<void> onSendChatInviteEvent(
      SendChatInviteEvent event, Emitter<UserState> emit) async {
    try {
      await firebaseHelper.sendChatInvite(
        event.currentUserId,
        event.selectedUserId,
        event.inviteMessage,
      );
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchUsersEvent extends UserEvent {}

class SendChatInviteEvent extends UserEvent {
  final String currentUserId;
  final String selectedUserId;
  final String inviteMessage;

  SendChatInviteEvent(
      {required this.currentUserId,
      required this.selectedUserId,
      required this.inviteMessage});

  @override
  List<Object?> get props => [currentUserId, selectedUserId, inviteMessage];
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<DocumentSnapshot> users;

  UserLoadedState(this.users);

  @override
  List<Object?> get props => [users];
}

class UserErrorState extends UserState {
  final String error;

  UserErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class InviteStatusState extends UserState {
  final bool isPending;
  final bool isDeclined;
  final bool isAccepted;

  InviteStatusState(
      {required this.isPending,
      required this.isDeclined,
      required this.isAccepted});

  @override
  List<Object?> get props => [isPending, isDeclined, isAccepted];
}
import 'package:chat_app/screen/invitation_flow/bloc/invitation_bloc.dart';
import 'package:chat_app/screen/invitation_flow/bloc/invitation_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../bloc/invitation_state.dart';

class InvitationPage extends StatelessWidget {
  const InvitationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvitationBloc()..add(FetchInvitationsEvent()),
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: const Text('Invitations Messages'),
        ),
        body: BlocBuilder<InvitationBloc, InvitationState>(
          builder: (context, state) {
            if (state is InvitationLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is InvitationErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state is InvitationLoadedState) {
              final invitations = state.invitations;

              if (invitations.isEmpty) {
                return const Center(child: Text('No invitations.'));
              }

              return ListView.builder(
                itemCount: invitations.length,
                itemBuilder: (context, index) {
                  var inviteData =
                      invitations[index].data() as Map<String, dynamic>;
                  String inviterId = inviteData['inviterId'];
                  String inviteMessage = inviteData['message'];
                  Timestamp? inviteTime = inviteData['inviteTime'];
                  String formattedTime = inviteTime != null
                      ? DateFormat('hh:mm a').format(inviteTime.toDate())
                      : 'Unknown Time';

                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(inviterId)
                        .get(),
                    builder: (context, inviterSnapshot) {
                      if (inviterSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (inviterSnapshot.hasError) {
                        return Center(
                            child: Text('Error: ${inviterSnapshot.error}'));
                      }

                      var inviterData =
                          inviterSnapshot.data?.data() as Map<String, dynamic>;
                      String inviterName = inviterData['username'] ?? 'Unknown';
                      String inviterProfileImage =
                          inviterData['profileImage'] ?? '';

                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: inviterProfileImage.isNotEmpty
                                    ? NetworkImage(inviterProfileImage)
                                    : const AssetImage(
                                            'assets/images/profile.png')
                                        as ImageProvider,
                                radius: 25,
                              ),
                              SizedBox(width: 2.h),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          inviterName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          formattedTime,
                                          style: const TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 0.5.h),
                                    Text(inviteMessage,
                                        style: const TextStyle(fontSize: 14)),
                                    SizedBox(height: 1.5.h),
                                    Row(
                                      children: [
                                        buildActionButton(
                                            context, 'Decline', Colors.red, () {
                                          context.read<InvitationBloc>().add(
                                              DeclineInvitationEvent(
                                                  invitationId:
                                                      invitations[index].id));
                                        }),
                                        const SizedBox(width: 16),
                                        buildActionButton(
                                            context, 'Accept', Colors.green,
                                            () {
                                          context
                                              .read<InvitationBloc>()
                                              .add(AcceptInvitationEvent(
                                                invitationId:
                                                    invitations[index].id,
                                                inviterId: inviterId,
                                              ));
                                        }),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
            return const Center(child: Text('Unknown State'));
          },
        ),
      ),
    );
  }

  Widget buildActionButton(
      BuildContext context, String label, Color color, VoidCallback onPressed) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          label,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/firebase_services.dart';
import '../../../services/notification_services.dart';
import 'invitation_event.dart';
import 'invitation_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InvitationBloc extends Bloc<InvitationEvent, InvitationState> {
  InvitationBloc() : super(InvitationInitialState()) {

    on<FetchInvitationsEvent>((event, emit) async {
      emit(InvitationLoadingState()); 

      try {
        var userId = FirebaseAuth.instance.currentUser!.uid;
        var invitations = await FirebaseFirestore.instance
            .collection('invitations')
            .where('inviteeId', isEqualTo: userId)
            .where('status', isEqualTo: 'pending')
            .get();

        emit(InvitationLoadedState(invitations: invitations.docs));
      } catch (e) {
        emit(InvitationErrorState(message: 'Failed to load invitations: $e'));
      }
    });

    on<AcceptInvitationEvent>((event, emit) async {
      try {
        await FirebaseFirestore.instance
            .collection('invitations')
            .doc(event.invitationId)
            .update({'status': 'accepted'});

        await FirebaseHelper.firebaseHelper.createChat(event.inviterId);

        add(FetchInvitationsEvent());
      } catch (e) {
        emit(InvitationErrorState(message: 'Failed to accept invitation: $e'));
      }
    });

    on<DeclineInvitationEvent>((event, emit) async {
      try {
        await FirebaseFirestore.instance
            .collection('invitations')
            .doc(event.invitationId)
            .update({'status': 'declined'});

        add(FetchInvitationsEvent());
      } catch (e) {
        emit(InvitationErrorState(message: 'Failed to decline invitation: $e'));
      }
    });
  }
}
import 'package:equatable/equatable.dart';

abstract class InvitationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchInvitationsEvent extends InvitationEvent {}

class AcceptInvitationEvent extends InvitationEvent {
  final String invitationId;
  final String inviterId;

  AcceptInvitationEvent({
    required this.invitationId,
    required this.inviterId,
  });

  @override
  List<Object?> get props => [invitationId, inviterId];
}

class DeclineInvitationEvent extends InvitationEvent {
  final String invitationId;

  DeclineInvitationEvent({required this.invitationId});

  @override
  List<Object?> get props => [invitationId];
}

import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class InvitationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InvitationInitialState extends InvitationState {}

class InvitationLoadingState extends InvitationState {}

class InvitationLoadedState extends InvitationState {
  final List<QueryDocumentSnapshot> invitations;

  InvitationLoadedState({required this.invitations});

  @override
  List<Object?> get props => [invitations];
}

class InvitationErrorState extends InvitationState {
  final String message;

  InvitationErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../services/firebase_services.dart';

class SelectUsersPage extends StatefulWidget {
  const SelectUsersPage({super.key});

  @override
  State<SelectUsersPage> createState() => _SelectUsersPageState();
}

class _SelectUsersPageState extends State<SelectUsersPage> {
  final List<String> selectedUsers = [];
  final TextEditingController groupNameController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    groupNameController.dispose();
    super.dispose();
  }

  Future<void> createGroup() async {
    if (selectedUsers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one user')),
      );
      return;
    }

    if (groupNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a group name')),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      await FirebaseHelper.firebaseHelper.createGroupChat(
        groupNameController.text.trim(),
        selectedUsers,
      );
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Group created successfully!')),
        );
    } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating group: $e')),
        );
    } finally {
        setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Create Group',
          style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (selectedUsers.isNotEmpty)
            TextButton(
              onPressed: isLoading ? null : () => createGroup(),
              child: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Create'),
            ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: groupNameController,
              decoration: InputDecoration(
                hintText: 'Group Name',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Selected Users: ${selectedUsers.length}',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final users = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final userData =
                        users[index].data() as Map<String, dynamic>;
                    final userId = users[index].id;
                    final username = userData['username'] ?? 'Unknown User';
                    final profileImage = userData['profileImage'] ?? '';

                    if (userId == FirebaseAuth.instance.currentUser?.uid) {
                      return const SizedBox.shrink();
                    }

                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: profileImage.isNotEmpty
                              ? NetworkImage(profileImage)
                              : const AssetImage('assets/images/profile.png')
                                  as ImageProvider,
                        ),
                        title: Text(
                          username,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        trailing: Checkbox(
                          value: selectedUsers.contains(userId),
                          activeColor: Colors.black54,
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                selectedUsers.add(userId);
                              } else {
                                selectedUsers.remove(userId);
                              }
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/screen/chat_flow/bloc/chat_bloc.dart';
import 'package:chat_app/screen/chat_flow/bloc/chat_event.dart';
import 'package:chat_app/screen/chat_flow/bloc/chat_state.dart';
import 'package:chat_app/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../data/model.dart';

const List<String> reactions = ['❤️', '👍', '👎', '😂', '😮', '🤝', '🔥'];

class ChatPage extends StatefulWidget {
  final String chatId;

  const ChatPage({super.key, required this.chatId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with WidgetsBindingObserver {
  final controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool shouldAutoScroll = true;
  String? chatName;
  bool isGroup = false;
  String? otherUserId;
  Stream<DocumentSnapshot>? userStatusStream;
  Timer? typingTimer;
  bool isTyping = false;
  final Set<Message> selectedMessages = {};
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<Message> searchResults = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    scrollController.addListener(scrollListener);
    initializeChat();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToBottom();
    });
    controller.addListener(onTextChanged);
  }

  void initializeChat() {
    context.read<ChatBloc>().add(LoadMessagesEvent(widget.chatId));
    getChatInfo();
    FirebaseHelper.firebaseHelper.resetUnreadCount(widget.chatId);
  }

  void scrollListener() {
    if (scrollController.hasClients) {
      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.position.pixels;
      shouldAutoScroll = (maxScroll - currentScroll) < 50;
    }
  }

  void onTextChanged() {
    if (!isTyping) {
      isTyping = true;
      FirebaseHelper.firebaseHelper.setTypingStatus(widget.chatId, true);
    }

    typingTimer?.cancel();
    typingTimer = Timer(const Duration(milliseconds: 1000), () {
      isTyping = false;
      FirebaseHelper.firebaseHelper.setTypingStatus(widget.chatId, false);
    });
  }

  @override
  void dispose() {
    typingTimer?.cancel();
    controller.removeListener(onTextChanged);
    FirebaseHelper.firebaseHelper.setTypingStatus(widget.chatId, false);
    FirebaseHelper.firebaseHelper.resetUnreadCount(widget.chatId);
    WidgetsBinding.instance.removeObserver(this);
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    controller.dispose();
    searchController.dispose();
    super.dispose();
  }

  Future<void> getChatInfo() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;
    final chatDoc = await FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatId)
        .get();

    final chatData = chatDoc.data();
    if (chatData == null) return;

    isGroup = chatData['isGroup'] ?? false;

    if (isGroup) {
      setState(() {
        chatName = chatData['groupName'] ?? 'Unnamed Group';
      });
    } else {
      List<String> users = List<String>.from(chatData['users'] ?? []);
      otherUserId = users.firstWhere(
        (userId) => userId != currentUser.uid,
        orElse: () => '',
      );

      if (otherUserId!.isNotEmpty) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(otherUserId)
            .get();
        setState(() {
          chatName = userDoc.data()?['username'] ?? 'Unknown User';
          userStatusStream =
              FirebaseHelper.firebaseHelper.getUserOnlineStatus(otherUserId!);
        });
      }
    }
  }

  bool _shouldShowTimestamp(Message current, Message previous) {
    final currentDate = current.timestamp.toDate();
    final previousDate = previous.timestamp.toDate();

    return !isSameDay(currentDate, previousDate);
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Widget _buildDateSeparator(DateTime date) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              formatDate(date),
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final messageDate = DateTime(date.year, date.month, date.day);

    if (messageDate == today) {
      return 'Today';
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('MMM d, y').format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Navigated to ChatPage with chatId: ${widget.chatId}');
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatBloc, ChatState>(
              listenWhen: (previous, current) =>
                  current is MessageSentState || current is MessageErrorState,
              listener: (context, state) {
                if (state is MessagesLoadedState || state is MessageSentState) {
                  scrollToBottom();
                } else if (state is MessageErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }

              },
              buildWhen: (previous, current) =>
                  current is MessagesLoadedState || current is ChatInitialState,
              builder: (context, state) {
                if (state is MessagesLoadedState) {
                  return _buildMessageList(state.messages);
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList(List<Message> messages) {
    final displayMessages =
        searchResults.isNotEmpty && isSearching ? searchResults : messages;

    if (displayMessages.isEmpty) {
      return Center(
        child: Text(
          isSearching ? 'No messages found' : 'No messages yet.',
          style: TextStyle(color: Colors.grey.shade600),
        ),
      );
    }

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(12),
      itemCount: displayMessages.length,
      itemBuilder: (context, index) {
        final message = displayMessages[index];
        final showTimestamp = index == 0 ||
            _shouldShowTimestamp(
                displayMessages[index], displayMessages[index - 1]);

        return GestureDetector(
          onLongPress: () => _selectMessage(message),
          onTap: () {
            if (selectedMessages.isNotEmpty) {
              _selectMessage(message);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: selectedMessages.contains(message)
                  ? Colors.blue.shade50
                  : Colors.transparent,
            ),
            child: Column(
              children: [
                if (showTimestamp)
                  _buildDateSeparator(message.timestamp.toDate()),
                MessageBubble(
                  message: message,
                  isGroup: isGroup,
                  chatId: widget.chatId,
                  isSelected: selectedMessages.contains(message),
                  onTap: selectedMessages.isNotEmpty
                      ? () => _selectMessage(message)
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Colors.grey.shade100,
      leadingWidth: 70,
      titleSpacing: 0,
      leading: InkWell(
        onTap: () {
          FirebaseHelper.firebaseHelper.resetUnreadCount(widget.chatId);
          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back, color: Colors.grey.shade800),
          ],
        ),
      ),
      title: _buildAppBarTitle(),
      actions: [
        if (selectedMessages.isNotEmpty) ...[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '${selectedMessages.length} selected',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red.shade600),
            onPressed: _deleteSelectedMessages,
          ),
          IconButton(
            icon: Icon(
              selectedMessages.first.isPinned
                  ? Icons.push_pin
                  : Icons.push_pin_outlined,
              color: Colors.blue,
            ),
            onPressed: () {
              togglePin(selectedMessages.first);
              setState(() => selectedMessages.clear());
            },
          ),
        ] else ...[
          IconButton(
            icon: Icon(
              isSearching ? Icons.close : Icons.search,
              color: Colors.grey.shade700,
            ),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  searchController.clear();
                  searchResults.clear();
                }
              });
            },
          ),
          if (isGroup)
            IconButton(
              icon: Icon(Icons.group, color: Colors.grey.shade700),
              onPressed: () {},
            ),
        ],
        BlocListener<ChatBloc, ChatState>(
          listener: (context, state) {
            if (state is MessagesDeletedState) {
            } else if (state is MessageErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.grey.shade700),
            color: Colors.white,
            onSelected: (value) async {
              if (value == 'delete') {
                bool? confirmDelete = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: const Text(
                      'Delete Messages',
                      style: TextStyle(color: Colors.black),
                    ),
                    content: Text(
                      'Are you sure you want to delete all messages in this chat?',
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text(
                          'Delete',
                          style: TextStyle(color: Colors.red.shade600),
                        ),
                      ),
                    ],
                  ),
                );
                if (confirmDelete == true) {
                  context
                      .read<ChatBloc>()
                      .add(DeleteAllMessagesEvent(widget.chatId));
                }
              } else if (value == 'remove') {
                bool? confirmRemove = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    title: const Text(
                      'Remove Chat',
                      style: TextStyle(color: Colors.black),
                    ),
                    content: Text(
                      'Are you sure you want to remove this chat?',
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text(
                          'Remove',
                          style: TextStyle(color: Colors.red.shade600),
                        ),
                      ),
                    ],
                  ),
                );

                if (confirmRemove == true) {
                  try {
                    final messagesQuery = await FirebaseFirestore.instance
                        .collection('chats')
                        .doc(widget.chatId)
                        .collection('messages')
                        .get();

                    final batch = FirebaseFirestore.instance.batch();

                    for (var doc in messagesQuery.docs) {
                      batch.delete(doc.reference);
                    }

                    batch.delete(FirebaseFirestore.instance
                        .collection('chats')
                        .doc(widget.chatId));

                    final invitationsQuery = await FirebaseFirestore.instance
                        .collection('invitations')
                        .where('inviterId', whereIn: [
                      FirebaseAuth.instance.currentUser?.uid,
                      otherUserId
                    ]).where('inviteeId', whereIn: [
                      FirebaseAuth.instance.currentUser?.uid,
                      otherUserId
                    ]).get();

                    for (var doc in invitationsQuery.docs) {
                      batch.delete(doc.reference);
                    }

                    await batch.commit();

                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Chat removed successfully')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error removing chat: $e')),
                    );
                  }
                }
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Text('Delete Messages'),
                ),
                const PopupMenuItem<String>(
                  value: 'remove',
                  child: Text('Remove Chat'),
                ),
              ];
            },
          ),
        ),
      ],
      bottom: isSearching
          ? PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() => searchResults.clear());
                      return;
                    }

                    final state = context.read<ChatBloc>().state;
                    if (state is MessagesLoadedState) {
                      setState(() {
                        searchResults = state.messages
                            .where((message) => message.message
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    }
                  },
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildMessageInput() {
    scrollToBottom();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Message',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color: Colors.grey.shade600,
            onPressed: () {
              final message = controller.text.trim();
              if (message.isNotEmpty) {
                context
                    .read<ChatBloc>()
                    .add(SendMessageEvent(widget.chatId, message));
                controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          chatName ?? 'Chat',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (!isGroup && userStatusStream != null)
          StreamBuilder<DocumentSnapshot>(
            stream:
                FirebaseHelper.firebaseHelper.getTypingStatus(widget.chatId),
            builder: (context, typingSnapshot) {
              if (!typingSnapshot.hasData || !typingSnapshot.data!.exists) {
                return const SizedBox.shrink();
              }

              try {
                final typingData = typingSnapshot.data?.get('typing') as Map?;
                final isOtherUserTyping = typingData?[otherUserId] ?? false;
                if (isOtherUserTyping) {
                  return Text(
                    'Typing...',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.green.shade600,
                      fontStyle: FontStyle.italic,
                    ),
                  );
                }

                return StreamBuilder<DocumentSnapshot>(
                  stream: userStatusStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return const SizedBox.shrink();
                    }
                    final isOnline = snapshot.data?.get('isOnline') ?? false;
                    return Text(
                      isOnline ? 'Online' : 'Offline',
                      style: TextStyle(
                        fontSize: 13,
                        color: isOnline
                            ? Colors.green.shade600
                            : Colors.grey.shade600,
                      ),
                    );
                  },
                );
              } catch (e) {
                return const SizedBox.shrink();
              }
            },
          ),
      ],
    );
  }

  void _selectMessage(Message message) {
    setState(() {
      if (selectedMessages.contains(message)) {
        selectedMessages.remove(message);
      } else {
        selectedMessages.add(message);
      }
    });
  }

  Future<void> _deleteSelectedMessages() async {
    if (selectedMessages.isEmpty) return;

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;

    final canDeleteAny =
        selectedMessages.any((message) => message.senderId == currentUser.uid);

    if (!canDeleteAny) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You can only delete your own messages'),
        ),
      );
      return;
    }

    try {
      context.read<ChatBloc>().add(DeleteSelectedMessagesEvent(
            widget.chatId,
            selectedMessages.toList(),
            currentUser.uid,
          ));

      setState(() {
        selectedMessages.clear();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting messages: $e')),
      );
    }
  }

  void togglePin(Message message) {
    print(
        'Toggling pin for message: ${message.id}, current status: ${message.isPinned}');
    context.read<ChatBloc>().add(ToggleMessagePinEvent(
          widget.chatId,
          message.id,
          !message.isPinned,
        ));
  }
}

class MessageBubble extends StatefulWidget {
  final Message message;
  final bool isGroup;
  final bool isSelected;
  final Function()? onTap;
  final String chatId;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isGroup,
    required this.chatId,
    this.isSelected = false,
    this.onTap,
  });

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool isEditing = false;
  late TextEditingController editController;

  @override
  void initState() {
    super.initState();
    editController = TextEditingController(text: widget.message.message);
  }

  @override
  void dispose() {
    editController.dispose();
    super.dispose();
  }

  void handleEdit() {
    final newMessage = editController.text.trim();
    if (newMessage.isNotEmpty && newMessage != widget.message.message) {
      context.read<ChatBloc>().add(EditMessageEvent(
            widget.chatId,
            widget.message.id,
            newMessage,
          ));
    }
    setState(() => isEditing = false);
  }

  void showReactionPicker(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;

    showDialog(
      context: context,
      builder: (context) => BlocListener<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is ReactionUpdatedState) {
            Navigator.pop(context);
          } else if (state is ReactionErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(8),
          content: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            children: reactions.map((reaction) {
              final isSelected =
                  widget.message.reactions[currentUser.uid] == reaction;
              return InkWell(
                onTap: () {
                  context.read<ChatBloc>().add(ToggleReactionEvent(
                        widget.chatId,
                        widget.message.id,
                        currentUser.uid,
                        reaction,
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        isSelected ? Colors.blue.shade100 : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    reaction,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final isSentByUser = widget.message.senderId == currentUser?.uid;

    return GestureDetector(
      onLongPress: isSentByUser ? widget.onTap : null,
      onTap: isSentByUser
          ? () => setState(() => isEditing = true)
          : (widget.onTap ?? () => showReactionPicker(context)),
      child: Align(
        alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? Colors.blue.shade100
                : (isSentByUser ? Colors.grey.shade200 : Colors.white),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (isEditing) ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: editController,
                        autofocus: true,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onSubmitted: (_) => handleEdit(),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () => setState(() => isEditing = false),
                    ),
                    IconButton(
                      icon: const Icon(Icons.check, size: 20),
                      onPressed: handleEdit,
                    ),
                  ],
                ),
              ] else
                Text(
                  widget.message.message,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade800,
                  ),
                ),
              if (widget.message.reactions.isNotEmpty) ...[
                const SizedBox(height: 4),
                Wrap(
                  spacing: 4,
                  children: widget.message.reactions.entries.map((entry) {
                    return Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(entry.value,
                          style: const TextStyle(fontSize: 12)),
                    );
                  }).toList(),
                ),
              ],
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.message.isPinned)
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Icon(
                        Icons.push_pin,
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  if (widget.message.isEdited ?? false)
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(
                        'edited',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  Text(
                    DateFormat('HH:mm')
                        .format(widget.message.timestamp.toDate()),
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  if (isSentByUser) ...[
                    const SizedBox(width: 4),
                    Icon(
                      Icons.done_all,
                      size: 16,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String id;
  final String senderId;
  final String message;
  final Timestamp timestamp;
  final Map<String, String> reactions;
  final bool? isEdited;
  final bool isPinned;

  Message({
    required this.id,
    required this.senderId,
    required this.message,
    required this.timestamp,
    this.reactions = const {},
    this.isEdited,
    this.isPinned = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'message': message,
      'timestamp': timestamp,
      'reactions': reactions,
      'isEdited': isEdited,
      'isPinned': isPinned,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] ?? '',
      senderId: map['senderId'] ?? '',
      message: map['message'] ?? '',
      timestamp: map['timestamp'] ?? Timestamp.now(),
      reactions: Map<String, String>.from(map['reactions'] ?? {}),
      isEdited: map['isEdited'],
      isPinned: map['isPinned'] ?? false,
    );
  }
}
import 'package:chat_app/screen/chat_flow/data/model.dart';
import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitialState extends ChatState {}

class MessagesLoadedState extends ChatState {
  final List<Message> messages;

  const MessagesLoadedState(this.messages);

  @override
  List<Object> get props => [messages];
}

class MessageSendingState extends ChatState {}

class MessageSentState extends ChatState {}

class MessageErrorState extends ChatState {
  final String error;
  const MessageErrorState(this.error);

  @override
  List<Object> get props => [error];
}
class MessagesEmptyState extends ChatState {}

class MessagesDeletedState extends ChatState {}

class ReactionUpdatingState extends ChatState {}

class ReactionUpdatedState extends ChatState {}

class ReactionErrorState extends ChatState {
  final String error;
  const ReactionErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class MessageEditingState extends ChatState {}

class MessageEditedState extends ChatState {}
import 'package:chat_app/screen/chat_flow/data/model.dart';
import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class LoadMessagesEvent extends ChatEvent {
  final String chatId;

  const LoadMessagesEvent(this.chatId);

  @override
  List<Object> get props => [chatId];
}

class SendMessageEvent extends ChatEvent {
  final String chatId;
  final String message;

  const SendMessageEvent(this.chatId, this.message);

  @override
  List<Object> get props => [chatId, message];
}

class DeleteAllMessagesEvent extends ChatEvent {
  final String chatId;

  const DeleteAllMessagesEvent(this.chatId);
}

class NewMessagesEvent extends ChatEvent {
  final List<Message> messages;

  const NewMessagesEvent(this.messages);

  @override
  List<Object> get props => [messages];
}

class ToggleReactionEvent extends ChatEvent {
  final String chatId;
  final String messageId;
  final String userId;
  final String reaction;

  const ToggleReactionEvent(
    this.chatId,
    this.messageId,
    this.userId,
    this.reaction,
  );

  @override
  List<Object> get props => [chatId, messageId, userId, reaction];
}

class DeleteSelectedMessagesEvent extends ChatEvent {
  final String chatId;
  final List<Message> messages;
  final String userId;

  const DeleteSelectedMessagesEvent(this.chatId, this.messages, this.userId);

  @override
  List<Object> get props => [chatId, messages, userId];
}

class EditMessageEvent extends ChatEvent {
  final String chatId;
  final String messageId;
  final String newMessage;

  const EditMessageEvent(this.chatId, this.messageId, this.newMessage);

  @override
  List<Object> get props => [chatId, messageId, newMessage];
}

class ToggleMessagePinEvent extends ChatEvent {
  final String chatId;
  final String messageId;
  final bool isPinned;

  const ToggleMessagePinEvent(this.chatId, this.messageId, this.isPinned);

  @override
  List<Object> get props => [chatId, messageId, isPinned];
}
import 'package:chat_app/screen/chat_flow/bloc/chat_event.dart';
import 'package:chat_app/screen/chat_flow/bloc/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/screen/chat_flow/data/model.dart';
import 'package:chat_app/services/firebase_services.dart';
import 'dart:async';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  StreamSubscription<QuerySnapshot>? messagesSubscription;

  ChatBloc() : super(ChatInitialState()) {
    on<LoadMessagesEvent>(onLoadMessages);

    on<SendMessageEvent>(onSendMessage);

    on<DeleteAllMessagesEvent>(onDeleteAllMessages);

    on<NewMessagesEvent>(onNewMessages);

    on<ToggleReactionEvent>(onToggleReaction);
 
    on<DeleteSelectedMessagesEvent>(onDeleteSelectedMessages);

    on<EditMessageEvent>(onEditMessage);

    on<ToggleMessagePinEvent>((event, emit) async {
      try {
        await FirebaseHelper.firebaseHelper.toggleMessagePin(
          event.chatId,
          event.messageId,
          event.isPinned,
        );
        
        add(LoadMessagesEvent(event.chatId));
      } catch (e) {
        emit(MessageErrorState(e.toString()));
      }
    });
  }

  void onLoadMessages(LoadMessagesEvent event, Emitter<ChatState> emit) {
    try {
      messagesSubscription?.cancel();

      messagesSubscription = FirebaseFirestore.instance
          .collection('chats')
          .doc(event.chatId)
          .collection('messages')
          .orderBy('timestamp')
          .snapshots()
          .listen((snapshot) {
        // Check if the snapshot is empty
        if (snapshot.docs.isEmpty) {
          emit(MessagesEmptyState()); // Emit an empty state if no messages found
        } else {
          final messages = snapshot.docs.map((doc) {
            final data = doc.data();
            data['id'] = doc.id;
            return Message.fromMap(data);
          }).toList();

          add(NewMessagesEvent(messages));
        }
      });
    } catch (e) {
      emit(MessageErrorState(e.toString()));
    }
  }


  void onNewMessages(NewMessagesEvent event, Emitter<ChatState> emit) {
    if (event.messages.isEmpty) {
      emit(MessagesEmptyState()); // Show empty state if no messages
    } else {
      emit(MessagesLoadedState(event.messages));
    }
  }

  Future<void> onSendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    try {
      emit(MessageSendingState());

      await FirebaseHelper.firebaseHelper.sendMessage(
        event.chatId,
        event.message,
      );

      add(LoadMessagesEvent(event.chatId));

      emit(MessageSentState());
    } catch (e) {
      emit(MessageErrorState(e.toString()));
    }
  }

  Future<void> onDeleteAllMessages(
      DeleteAllMessagesEvent event, Emitter<ChatState> emit) async {
    try {
      final messagesRef = FirebaseFirestore.instance
          .collection('chats')
          .doc(event.chatId)
          .collection('messages');

      final snapshot = await messagesRef.get();

      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }

      emit(MessagesDeletedState());

      add(LoadMessagesEvent(event.chatId));
    } catch (e) {
      emit(MessageErrorState('Error deleting messages: $e'));
    }
  }

  Future<void> onToggleReaction(
    ToggleReactionEvent event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(ReactionUpdatingState());

      await FirebaseHelper.firebaseHelper.toggleReaction(
        event.chatId,
        event.messageId,
        event.userId,
        event.reaction,
      );

      emit(ReactionUpdatedState());
    } catch (e) {
      emit(ReactionErrorState(e.toString()));
    }
  }

  Future<void> onDeleteSelectedMessages(
    DeleteSelectedMessagesEvent event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(MessageSendingState());

      await FirebaseHelper.firebaseHelper.deleteMessages(
        event.chatId,
        event.messages,
        event.userId,
      );

      emit(MessagesDeletedState());
      add(LoadMessagesEvent(event.chatId));
    } catch (e) {
      emit(MessageErrorState(e.toString()));
    }
  }

  Future<void> onEditMessage(
    EditMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    try {
      emit(MessageEditingState());
      
      await FirebaseHelper.firebaseHelper.editMessage(
        event.chatId,
        event.messageId,
        event.newMessage,
      );

      emit(MessageEditedState());
      add(LoadMessagesEvent(event.chatId));
    } catch (e) {
      emit(MessageErrorState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    messagesSubscription?.cancel();

    return super.close();
  }
}
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import '../../../../components/button_common.dart';
import '../../../../components/text_filed.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/signup_bloc.dart';
import '../bloc/signup_event.dart';
import '../bloc/signup_state.dart';
import 'dart:io';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}
class _SignupPageState extends State<SignupPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  File? profileImage;

  Future<void> pickImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.white,
          title: const Text("Select Image Source"),
          children: [
            SimpleDialogOption(
              onPressed: () async {
                Navigator.of(context).pop();
                await pickFromGallery();
              },
              child: const Text('Pick from Gallery'),
            ),
            SimpleDialogOption(
              onPressed: () async {
                Navigator.of(context).pop();
                await pickFromCamera();
              },
              child: const Text('Take a Photo'),
            ),
          ],
        );
      },
    );
  }

  Future<void> pickFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> pickFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[100],
                    backgroundImage:
                    profileImage != null ? FileImage(profileImage!) : null,
                    child: profileImage == null
                        ? const Icon(
                      Icons.camera_alt,
                      size: 40,
                      color: Colors.grey,
                    )
                        : null,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: Container(
                      height: 4.5.h,
                      width: 141,
                      decoration: const BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: const Center(
                        child: Text(
                          "Add Profile Image",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Text(
                    "Let's create an account for you!",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        MyTextField(
                          controller: userNameController,
                          hintText: "User Name",
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'User Name is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        MyTextField(
                          controller: emailController,
                          hintText: "Email",
                          obscureText: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }

                            String pattern = r'\w+@\w+\.\w+';
                            RegExp regExp = RegExp(pattern);
                            if (!regExp.hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        MyTextField(
                          controller: passwordController,
                          hintText: "Password",
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        MyTextField(
                          controller: confirmPasswordController,
                          hintText: "Confirm Password",
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        BlocConsumer<SignupBloc, SignupState>(
                          listener: (context, state) {
                            if (state is SignupFailed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.errorMessage)),
                              );
                            }
                            if (state is SignupSuccess) {
                              Navigator.pushNamed(context, 'login');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Signup Successful!')),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is SignupInProgress) {
                              return const CircularProgressIndicator(
                                color: Colors.black,
                              );
                            }
                            return MyButton(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<SignupBloc>().add(
                                    SignupButtonPressed(
                                      username: userNameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      confirmPassword: confirmPasswordController.text,
                                      urlImage: profileImage,
                                    ),
                                  );
                                }
                              },
                              text: "Sign Up",
                            );
                          },
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'login');
                              },
                              child: const Text(
                                "LogIn",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {}

class SignupInitial extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupInProgress extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupSuccess extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupFailed extends SignupState {
  final String errorMessage;

  SignupFailed(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {}

class SignupButtonPressed extends SignupEvent {
  final File? urlImage;
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  SignupButtonPressed({
    required this.urlImage,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props =>  [urlImage,username, email, password, confirmPassword];
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../services/firebase_services.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final FirebaseHelper firebaseHelper = FirebaseHelper.firebaseHelper;

  SignupBloc() : super(SignupInitial()) {
    on<SignupButtonPressed>(onSignupButtonPressed);
  }

  Future<void> onSignupButtonPressed(SignupButtonPressed event, Emitter<SignupState> emit) async {
    if (event.username.isEmpty ||
        event.email.isEmpty ||
        event.password.isEmpty ||
        event.confirmPassword.isEmpty) {
      emit(SignupFailed("All fields are required."));
      return;
    }

    if (event.password != event.confirmPassword) {
      emit(SignupFailed('Passwords do not match'));
      return;
    }

    if (event.urlImage == null) {
      emit(SignupFailed("Profile image is required."));
      return;
    }

    emit(SignupInProgress());

    try {
      String result = await firebaseHelper.createAccount(event.email, event.password);

      if (result == "Success") {
        // String profileImageUrl = '';
        // if (event.urlImage != null) {
        //   profileImageUrl =
        //     await firebaseHelper.uploadProfileImage(event.urlImage!);
        // }

        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await firebaseHelper.saveUserData(
            user.uid,
            event.username,
            event.email,
            // profileImageUrl,
          );
        }
        emit(SignupSuccess());
      } else {
        emit(SignupFailed(result));
      }
    } catch (e) {
      emit(SignupFailed(e.toString()));
    }
  }
}
import 'package:chat_app/components/button_common.dart';
import 'package:chat_app/screen/auth_flow/login_flow/bloc/login_bloc.dart';
import 'package:chat_app/screen/auth_flow/login_flow/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../components/text_filed.dart';
import '../../../../services/firebase_services.dart';
import '../bloc/login_event.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    const Icon(
                      Icons.message_rounded,
                      size: 100,
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    const Text(
                      "Welcome back you've been missed!!",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    MyTextField(
                      controller: emailController,
                      hintText: "Email",
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    MyTextField(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            await FirebaseHelper.firebaseHelper
                                .signInAnonymously()
                                .then(
                              (value) {
                                Navigator.pushReplacementNamed(context, 'home');
                              },
                            );
                          },
                          child: Container(
                            height: 7.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              color: const Color(0xffDADADA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.person,
                                color: Color(0xff2D2B2B)),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await FirebaseHelper.firebaseHelper
                                .googleSignIn()
                                .then((userCredential) {
                              debugPrint(
                                  "User signed in: ${userCredential.user!.displayName}");
                              Navigator.pushReplacementNamed(context, 'home');
                            }).catchError((e) {
                              debugPrint("Error signing in with Google: $e");
                            });
                          },
                          child: Container(
                            height: 7.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              color: const Color(0xffDADADA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.g_mobiledata_outlined,
                              color: Color(0xff2D2B2B),
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginFailed) {
                          if (state.errorMessage == "User not found. Please sign up.") {
                            Navigator.pushReplacementNamed(context, 'signUp');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please create an account first')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.errorMessage)),
                            );
                          }
                        }
                        if (state is LoginSuccess) {
                          Navigator.pushReplacementNamed(context, 'home');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login Successful!')),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginInProgress) {
                          return const CircularProgressIndicator(
                            color: Colors.black,
                          );
                        }
                        return MyButton(
                          onTap: () {
                            String email = emailController.text;
                            String password = passwordController.text;

                            if (email.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('All fields are required!')),
                              );
                            } else if (!isValidEmail(email)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Invalid email format!')),
                              );
                            } else if (password.length < 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Password must be at least 6 characters!')),
                              );
                            } else {
                              context.read<LoginBloc>().add(
                                    LoginButtonPressed(
                                      email: email,
                                      password: password,
                                    ),
                                  );
                            }
                          },
                          text: "LogIn",
                        );
                      },
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, 'signUp');
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool isValidEmail(String email) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }
}
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final String errorMessage;

  LoginFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email,password];
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../services/firebase_services.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseHelper firebaseHelper = FirebaseHelper.firebaseHelper;

  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(onLoginButtonPressed);
  }

  Future<void> onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(LoginFailed("All fields are required."));
      return;
    }

    emit(LoginInProgress());

    try {
      String result = await firebaseHelper.signInWithEmailPassword(event.email, event.password);

      if (result == "Success") {
        User? user = firebaseHelper.auth.currentUser;
        if (user != null) {
          bool userExists = await firebaseHelper.checkUserExists(user.uid);
          if (userExists) {
            emit(LoginSuccess());
          } else {
            emit(LoginFailed("User not found. Please sign up."));
            await firebaseHelper.deleteUserAccount(user.uid);
          }
        }
      } else {
        if (result.contains("invalid-credential")) {
          emit(LoginFailed("User not found. Please sign up."));
        } else {
          emit(LoginFailed(result));
        }
      }
    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.contains("invalid-credential") || 
          errorMessage.contains("user-not-found")) {
        emit(LoginFailed("User not found. Please sign up."));
      } else {
        emit(LoginFailed(errorMessage));
      }
    }
  }
}
import 'package:chat_app/generated/assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../services/firebase_services.dart';
import '../../chat_flow/view/chat_page.dart';
import '../bloc/chatlist_bloc.dart';
import '../bloc/chatlist_event.dart';
import '../bloc/chatlist_state.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late ChatListBloc chatListBloc;

  @override
  void initState() {
    super.initState();
    chatListBloc = ChatListBloc(firebaseHelper: FirebaseHelper.firebaseHelper);
    chatListBloc.add(LoadChatsEvent());
  }

  @override
  void dispose() {
    chatListBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => chatListBloc,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Messages',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.black54),
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
            ),
          ],
        ),
        endDrawer: Drawer(
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseHelper.firebaseHelper.getUserData(
              FirebaseHelper.firebaseHelper.auth.currentUser!.uid,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (!snapshot.hasData) {
                return const Center(child: Text('No user data available.'));
              }

              var userData = snapshot.data!.data() as Map<String, dynamic>;
              String username = userData['username'] ?? 'Unknown User';
              String profileImage = userData['profileImage'] ?? '';
              String email = userData['email'] ?? '';

              return _buildDrawerContent(username, profileImage, email);
            },
          ),
        ),
        body: Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: BlocBuilder<ChatListBloc, ChatListState>(
                builder: (context, state) {
                  if (state is ChatListLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ChatListError) {
                    return Center(child: Text(state.error));
                  }

                  if (state is ChatListLoaded) {
                    return StreamBuilder<QuerySnapshot>(
                      stream: state.chatsStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        final chatRooms = snapshot.data?.docs ?? [];
                        if (chatRooms.isEmpty) {
                          return _buildEmptyState();
                        }

                        return _buildChatList(chatRooms);
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'user'),
          backgroundColor: Colors.black54,
          elevation: 4,
          child: const Icon(Icons.chat_rounded, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No Chats yet',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatList(List<QueryDocumentSnapshot> chatRooms) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      physics: const BouncingScrollPhysics(),
      itemCount: chatRooms.length,
      itemBuilder: (context, index) => _buildChatItem(chatRooms[index]),
    );
  }

  Widget _buildChatItem(QueryDocumentSnapshot chatRoom) {
    final chatData = chatRoom.data() as Map<String, dynamic>;
    final lastMessage = chatData['lastMessage'] ?? '';
    final lastMessageTime = chatData['lastMessageTime'] as Timestamp?;
    final isGroup = chatData['isGroup'] ?? false;

    int unreadCount = 0;
    if (chatData['unreadCount'] != null && chatData['unreadCount'] is Map) {
      final unreadCounts = Map<String, dynamic>.from(chatData['unreadCount']);
      unreadCount =
          unreadCounts[FirebaseHelper.firebaseHelper.auth.currentUser!.uid] ??
              0;
    }

    String formattedTime = lastMessageTime != null
        ? DateFormat('hh:mm a').format(lastMessageTime.toDate())
        : '';

    return InkWell(
      onTap: () => _navigateToChat(chatRoom.id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            _buildAvatar(chatData, isGroup),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildChatName(chatData, isGroup),
                  const SizedBox(height: 4),
                  _buildLastMessage(lastMessage, unreadCount),
                ],
              ),
            ),
            _buildTimeAndUnread(formattedTime, unreadCount),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(Map<String, dynamic> chatData, bool isGroup) {
    if (isGroup) {
      return CircleAvatar(
        backgroundColor: Colors.grey[200],
        radius: 24,
        child: Icon(Icons.group, color: Colors.grey[600], size: 32),
      );
    }

    List<String> users = List<String>.from(chatData['users']);
    String otherUserId = users.firstWhere(
      (userId) => userId != FirebaseHelper.firebaseHelper.auth.currentUser!.uid,
      orElse: () => '',
    );

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseHelper.firebaseHelper.getUserData(otherUserId),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data?.data() != null) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          final profileImage = userData['profileImage'] ?? '';

          return CircleAvatar(
            radius: 24,
            backgroundImage: profileImage.isNotEmpty
                ? NetworkImage(profileImage)
                : const AssetImage(Assets.imagesProfile) as ImageProvider,
          );
        }
        return CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 24,
          child: Icon(Icons.person, color: Colors.grey[600], size: 32),
        );
      },
    );
  }

  Widget _buildChatName(Map<String, dynamic> chatData, bool isGroup) {
    if (isGroup) {
      return Text(
        chatData['groupName'] ?? 'Unnamed Group',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      );
    }

    List<String> users = List<String>.from(chatData['users']);
    String otherUserId = users.firstWhere(
      (userId) => userId != FirebaseHelper.firebaseHelper.auth.currentUser!.uid,
      orElse: () => '',
    );

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseHelper.firebaseHelper.getUserData(otherUserId),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data?.data() != null) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            userData['username'] ?? 'Unknown User',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          );
        }
        return const Text('Loading...');
      },
    );
  }

  Widget _buildLastMessage(String lastMessage, int unreadCount) {
    return Text(
      lastMessage,
      style: TextStyle(
        fontSize: 14,
        color: unreadCount > 0 ? Colors.black87 : Colors.grey.shade600,
        fontWeight: unreadCount > 0 ? FontWeight.w500 : FontWeight.normal,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTimeAndUnread(String formattedTime, int unreadCount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          formattedTime,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 8),
        if (unreadCount > 0)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(12),
            ),
            constraints: const BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            child: Center(
              child: Text(
                unreadCount.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
            ),
          ),
      ],
    );
  }

  void _navigateToChat(String chatId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(chatId: chatId),
      ),
    );
  }

  Widget _buildDrawerContent(
      String username, String profileImage, String email) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        _buildDrawerHeader(username, profileImage, email),
        _buildDrawerItem(
          icon: Icons.home,
          title: 'Home',
          onTap: () => Navigator.pop(context),
        ),
        _buildDrawerItem(
          icon: Icons.group,
          title: 'Create Group',
          onTap: () => Navigator.pushNamed(context, 'groupSelect'),
        ),
        _buildDrawerItem(
          icon: Icons.mail,
          title: 'Invitations',
          onTap: () => Navigator.pushNamed(context, 'notification'),
        ),
        _buildDrawerItem(
          icon: Icons.logout,
          title: 'Logout',
          onTap: () async {
            await FirebaseHelper.firebaseHelper.userLogout();
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ],
    );
  }

  Widget _buildDrawerHeader(
      String username, String profileImage, String email) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.black87, Colors.black54],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 25,
              backgroundImage: profileImage.isNotEmpty
                  ? NetworkImage(profileImage)
                  : const AssetImage(Assets.imagesProfile) as ImageProvider,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            username,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            email,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap,
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

abstract class ChatListState extends Equatable {}

class ChatListInitial extends ChatListState {
  @override
  List<Object?> get props => [];
}

class ChatListLoading extends ChatListState {
  @override
  List<Object?> get props => [];
}

class ChatListLoaded extends ChatListState {
  final Stream<QuerySnapshot> chatsStream;
  ChatListLoaded(this.chatsStream);

  @override
  List<Object?> get props => [chatsStream];
}

class ChatListError extends ChatListState {
  final String error;
  ChatListError(this.error);

  @override
  List<Object?> get props => [error];
}

import 'package:equatable/equatable.dart';

abstract class ChatListEvent extends Equatable {}

class LoadChatsEvent extends ChatListEvent {
  @override
  List<Object?> get props => [];
}

class UpdateUnreadCountEvent extends ChatListEvent {
  final String chatId;
  UpdateUnreadCountEvent(this.chatId);
  
  @override
  List<Object?> get props => [chatId];
}
import 'package:chat_app/screen/all_chats_flow/bloc/chatlist_event.dart';
import 'package:chat_app/screen/all_chats_flow/bloc/chatlist_state.dart';
import 'package:chat_app/services/firebase_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  final FirebaseHelper firebaseHelper;

  ChatListBloc({required this.firebaseHelper}) : super(ChatListInitial()) {
    on<LoadChatsEvent>(onLoadChats);
    on<UpdateUnreadCountEvent>(onUpdateUnreadCount);
  }

  void onLoadChats(LoadChatsEvent event, Emitter<ChatListState> emit) async {
    try {
      emit(ChatListLoading());
      final chatsStream = firebaseHelper.getChatsStream();
      emit(ChatListLoaded(chatsStream));
    } catch (e) {
      emit(ChatListError(e.toString()));
    }
  }

  void onUpdateUnreadCount(
      UpdateUnreadCountEvent event, Emitter<ChatListState> emit) async {
    try {
      await firebaseHelper.resetUnreadCount(event.chatId);
    } catch (e) {
      emit(ChatListError(e.toString()));
    }
  }
}
///This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class Assets {
  Assets._();

  static const String imagesProfile = 'assets/images/profile.png';
  static const String imagesSplash = 'assets/images/splash.png';
}
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 6.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: Colors.grey[100],
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      validator: validator,
    );
  }
}
name: chat_app
description: "A new Flutter project."
# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: ^3.5.3

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8
  flutter_bloc: ^8.1.6
  firebase_auth: ^5.3.4
  firebase_core: ^3.9.0
  sizer: ^3.0.4
  equatable:
  google_sign_in: ^6.2.2
  image_picker: ^1.1.2
  cloud_firestore: ^5.6.0
  firebase_storage: ^12.3.7
  intl: ^0.20.1
  firebase_messaging: ^15.1.6
  flutter_local_notifications: ^18.0.1
  flutter_chat_bubble: ^2.0.2
  auto_route: ^9.2.2
  auto_route_generator: ^9.0.0
  app_links: ^6.3.3
  url_launcher: ^6.3.1
  link_text: ^0.2.1

dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^4.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg
  assets:
    - assets/images/

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/to/resolution-aware-images

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/to/asset-from-package

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/to/font-from-package
// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBfcNUMKbOOjKBlyK41vPXrjvcC46ijMV4',
    appId: '1:181375027074:web:d40a0eaec22a07b1f1b19b',
    messagingSenderId: '181375027074',
    projectId: 'chatapp-4c7b9',
    authDomain: 'chatapp-4c7b9.firebaseapp.com',
    storageBucket: 'chatapp-4c7b9.firebasestorage.app',
    measurementId: 'G-8LSLJJJNYH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNrEL9m_H46BT6Dz03Q4o3EHJLj4in-y8',
    appId: '1:181375027074:android:e42d47268fa07d07f1b19b',
    messagingSenderId: '181375027074',
    projectId: 'chatapp-4c7b9',
    storageBucket: 'chatapp-4c7b9.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVxnaQ0xYM4LPPR70nlTNgRe65uuwB6nU',
    appId: '1:181375027074:ios:1b8a29e7feea5e2ff1b19b',
    messagingSenderId: '181375027074',
    projectId: 'chatapp-4c7b9',
    storageBucket: 'chatapp-4c7b9.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBVxnaQ0xYM4LPPR70nlTNgRe65uuwB6nU',
    appId: '1:181375027074:ios:1b8a29e7feea5e2ff1b19b',
    messagingSenderId: '181375027074',
    projectId: 'chatapp-4c7b9',
    storageBucket: 'chatapp-4c7b9.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBfcNUMKbOOjKBlyK41vPXrjvcC46ijMV4',
    appId: '1:181375027074:web:b421e61fb440e96ef1b19b',
    messagingSenderId: '181375027074',
    projectId: 'chatapp-4c7b9',
    authDomain: 'chatapp-4c7b9.firebaseapp.com',
    storageBucket: 'chatapp-4c7b9.firebasestorage.app',
    measurementId: 'G-G89H2GM1R0',
  );

}
{
  "project_info": {
    "project_number": "181375027074",
    "project_id": "chatapp-4c7b9",
    "storage_bucket": "chatapp-4c7b9.firebasestorage.app"
  },
  "client": [
    {
      "client_info": {
        "mobilesdk_app_id": "1:181375027074:android:6d90e7c1cf6a6f2ef1b19b",
        "android_client_info": {
          "package_name": "com.chatapp.app"
        }
      },
      "oauth_client": [
        {
          "client_id": "181375027074-iqu9is43d633v11ksumqg3vdnf555102.apps.googleusercontent.com",
          "client_type": 1,
          "android_info": {
            "package_name": "com.chatapp.app",
            "certificate_hash": "6c2359a9c8b6a151d87780607b3e2497db3e4ebd"
          }
        },
        {
          "client_id": "181375027074-b0kh15bv7qdnkatcpel9cs51miaip55t.apps.googleusercontent.com",
          "client_type": 3
        }
      ],
      "api_key": [
        {
          "current_key": "AIzaSyDNrEL9m_H46BT6Dz03Q4o3EHJLj4in-y8"
        }
      ],
      "services": {
        "appinvite_service": {
          "other_platform_oauth_client": [
            {
              "client_id": "181375027074-b0kh15bv7qdnkatcpel9cs51miaip55t.apps.googleusercontent.com",
              "client_type": 3
            },
            {
              "client_id": "181375027074-n11fjue0j1cj2mqs9cualeg9cl4to770.apps.googleusercontent.com",
              "client_type": 2,
              "ios_info": {
                "bundle_id": "com.example.chatApp"
              }
            }
          ]
        }
      }
    },
    {
      "client_info": {
        "mobilesdk_app_id": "1:181375027074:android:e42d47268fa07d07f1b19b",
        "android_client_info": {
          "package_name": "com.example.chat_app"
        }
      },
      "oauth_client": [
        {
          "client_id": "181375027074-97pn0c6h21hhm2hehsl367l6df13et9u.apps.googleusercontent.com",
          "client_type": 1,
          "android_info": {
            "package_name": "com.example.chat_app",
            "certificate_hash": "6c2359a9c8b6a151d87780607b3e2497db3e4ebd"
          }
        },
        {
          "client_id": "181375027074-b0kh15bv7qdnkatcpel9cs51miaip55t.apps.googleusercontent.com",
          "client_type": 3
        }
      ],
      "api_key": [
        {
          "current_key": "AIzaSyDNrEL9m_H46BT6Dz03Q4o3EHJLj4in-y8"
        }
      ],
      "services": {
        "appinvite_service": {
          "other_platform_oauth_client": [
            {
              "client_id": "181375027074-b0kh15bv7qdnkatcpel9cs51miaip55t.apps.googleusercontent.com",
              "client_type": 3
            },
            {
              "client_id": "181375027074-n11fjue0j1cj2mqs9cualeg9cl4to770.apps.googleusercontent.com",
              "client_type": 2,
              "ios_info": {
                "bundle_id": "com.example.chatApp"
              }
            }
          ]
        }
      }
    }
  ],
  "configuration_version": "1"
}
plugins {
    id "com.android.application"
    // START: FlutterFire Configuration
    id 'com.google.gms.google-services'
    // END: FlutterFire Configuration
    id "kotlin-android"
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id "dev.flutter.flutter-gradle-plugin"
}

android {
    namespace = "com.example.chat_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_1_8
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.chat_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.debug
        }
    }
}

flutter {
    source = "../.."
}

<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.chat_app">

    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
    <uses-permission android:name="android.permission.VIBRATE" />
    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
    <uses-permission android:name="android.permission.USE_FULL_SCREEN_INTENT" />

    <application
        android:label="chat_app"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTask"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <!-- Specifies an Android theme to apply to this Activity as soon as
                 the Android process has started. This theme is visible to the user
                 while the Flutter UI initializes. After that, this theme continues
                 to determine the Window background behind the Flutter UI. -->
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <!-- Don't delete the meta-data below.
             This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
    <!-- Required to query activities that can process text, see:
         https://developer.android.com/training/package-visibility and
         https://developer.android.com/reference/android/content/Intent#ACTION_PROCESS_TEXT.

         In particular, this is used by the Flutter engine in io.flutter.plugin.text.ProcessTextPlugin. -->
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
</manifest>

