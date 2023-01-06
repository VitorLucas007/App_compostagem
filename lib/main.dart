import 'package:app_compostagem/firebase_options.dart';
import 'package:app_compostagem/presentation/pages/details_page/details_page.dart';
import 'package:app_compostagem/presentation/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(home: HomePage(),));
}

