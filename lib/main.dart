import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iddaa_kazanc/screen/home_screen.dart';
import 'package:iddaa_kazanc/thema/thema_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Iddaa Kazancım',
            theme: notifier.darkTheme ? dark : light,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
