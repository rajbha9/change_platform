import 'package:change_platform/provider/contact_provider.dart';
import 'package:change_platform/provider/month_provider.dart';
import 'package:change_platform/provider/themeprovider.dart';
import 'package:change_platform/views/android/homepage.dart';
import 'package:change_platform/views/ios/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeChangeAppProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContactProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MonthProvider(),
        ),
      ],
      builder: (context, _) {
        return (Provider.of<ThemeChangeAppProvider>(context).isAndroid)
            ? MaterialApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  '/': (context) => HomePage(),
                },
              )
            : CupertinoApp(
                debugShowCheckedModeBanner: false,
                routes: {
                  '/': (context) => HomePageIOS(),
                },
              );
      },
    );
  }
}
