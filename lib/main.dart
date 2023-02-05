import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quote_app/quote/data/models/author.dart';
import 'package:quote_app/quote/data/models/quote.dart';
import 'package:quote_app/utils/bloc_providers.dart';

import 'home/presentation/pages/home_page.dart';


void main() async{
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  Hive.registerAdapter(QuoteAdapter());
  Hive.registerAdapter(AuthorAdapter());
  await Hive.openBox('favrouite_box');
  await Hive.openBox('author_box');
  await Hive.openBox('quotes_box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Playfair Display'
        ),
        home: HomePage()
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
      ((X509Certificate cert, String host, int port) {
        final isValidHost = ['https://api.quotable.io']
            .contains(host); // <-- allow only hosts in array
        return isValidHost;
      });
  }
}
