import 'package:betheheromobile/src/app_controller.dart';
import 'package:betheheromobile/src/pages/onboarding/onboarding_page.dart';
import 'package:betheheromobile/src/repositories/app_repository.dart';
import 'package:betheheromobile/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppController>(
          create: (_) => AppController(AppRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Be The Hero',
        theme: ThemeData(
          fontFamily: "Roboto",
          primaryColor: redColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SeenFirtPage(),
      ),
    );
  }
}
