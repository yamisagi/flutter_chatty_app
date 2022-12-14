import 'package:chatty_app/pages/chat_page.dart';
import 'package:chatty_app/pages/log_in_page.dart';
import 'package:chatty_app/pages/register_page.dart';
import 'package:chatty_app/pages/welcome_page.dart';
import 'package:chatty_app/services/firebase_service.dart';
import 'package:chatty_app/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAuthProvider().initializeApp();
  runApp(
    const MainPage(),
  );
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ProductTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/chat': (context) => const ChatPage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LogInPage(),
      },
      title: 'Chatty',
    );
  }
}
