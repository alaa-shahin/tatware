import 'package:tatware/modules/chat_module/chat_view.dart';
import 'package:tatware/modules/home_module/home_view.dart';

import '../index.dart';
import '../modules/getStart_module/getStart_view.dart';
import '../modules/welcom_module/welcome_view.dart';

abstract class Routes {
  static const Welcome = '/';
  static const GetStart = '/getStart';
  static const Chat = '/chat';
  static const Home = '/home';
}

Map<String, Widget Function(BuildContext)> routes = {
  Routes.Welcome: (context) => WelcomeView(),
  Routes.GetStart: (context) => GetStartView(),
  Routes.Home: (context) => HomeView(),
  Routes.Chat: (context) => ChatView(),
};
