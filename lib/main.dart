import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nuna_code_challenges/bloc_observer.dart';
import 'package:nuna_code_challenges/firebase_options.dart';
import 'package:nuna_code_challenges/navigation_menu.dart';
import 'package:nuna_code_challenges/src/data/data_soucres/comment_provider.dart';
import 'package:nuna_code_challenges/src/data/data_soucres/post_provider.dart';
import 'package:nuna_code_challenges/src/data/data_soucres/product_provider.dart';
import 'package:nuna_code_challenges/src/data/data_soucres/video_detail_provider.dart';
import 'package:nuna_code_challenges/src/data/data_soucres/video_provider.dart';
import 'package:nuna_code_challenges/src/data/repository/comment_repository.dart';
import 'package:nuna_code_challenges/src/data/repository/post_reposity.dart';
import 'package:nuna_code_challenges/src/data/repository/product_repository.dart';
import 'package:nuna_code_challenges/src/data/repository/video_detail_repository.dart';
import 'package:nuna_code_challenges/src/data/repository/video_repository.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/comments/comments_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/posts/posts_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/products/products_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/video_details/video_details_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/videos/video_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/screens/notification.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    requestPermission();
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.data}');

  if (message.notification != null) {
    print('Message also contained a notification: ${message.notification}');
  }
});
  Bloc.observer = AppBlocObserver();
  final fcmToken = await FirebaseMessaging.instance.getToken();
   print('Message data: ${fcmToken}');
   initPushNotification();
  runApp(App());
}


void handleMessage(RemoteMessage? message){
  if(message == null) return;

  navigatorKey.currentState?.pushNamed('/notification_screen',arguments: message);
}

Future initPushNotification() async {
   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
}

Future<void> requestPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

NotificationSettings settings = await messaging.requestPermission(
  alert: true,
  announcement: true,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);

print('User granted permission: ${settings.authorizationStatus}');
}

class App extends StatelessWidget {
  App({super.key});

  final ProductsRepository productsRepository =
      ProductsRepository(productDataProvider: ProductDataProvider());
  final PostRepository postRepository =
      PostRepository(postDataProvider: PostDataProvider());
  final CommentRepository commentRepository =
      CommentRepository(commentProvider: CommentProvider());
  final VideoRepository videoRepository = VideoRepository(videoDataProvider: VideoDataProvider());
  final VideoDetailRepository videoDetailRepository = VideoDetailRepository(videoDetailDataProvider: VideoDetailDataProvider());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductsBloc>(
              create: (context) =>
                  ProductsBloc(productsRepository: productsRepository)),
          BlocProvider<PostsBloc>(
              create: (context) => PostsBloc(postRepository: postRepository)),
          BlocProvider<CommentsBloc>(
              create: (context) =>
                  CommentsBloc(commentRepository: commentRepository)),
          BlocProvider<VideoBloc>(create: (context) => VideoBloc(videoRepository: videoRepository)),
          BlocProvider<VideoDetailsBloc>(create: (context) => VideoDetailsBloc(videoDetailRepository: videoDetailRepository)),
        ],
        child:  GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          navigatorKey: navigatorKey,
          home: const NavigationMenu(),
          routes: {
            '/notification_screen':(context) => const NotificationScreen(),
          },
        ));
  }
}
