import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shope/generated/l10n.dart';
import 'package:shope/pages/home.dart';
import 'package:shope/pages/incoming.dart';
import 'package:shope/pages/money.dart';
import 'package:shope/pages/outcoming.dart';
import 'package:shope/pages/persons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 1, 27, 65),
          titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(size: 40, color: Colors.white),
        ),
        drawerTheme: DrawerThemeData(),
      ),
      home: HomePage(),
      routes: {
        "home": (context) => HomePage(),
        "incoming": (context) => IncomingPage(),
        "outcoming": (context) => OutcomingPage(),
        "money": (context) => MoneyPage(),
        "persons": (context) => PersonsPage(),
      },
    );
  }
}
