import 'package:betheheromobile/src/app_controller.dart';
import 'package:betheheromobile/src/pages/onboarding/onboarding_page.dart';
import 'package:betheheromobile/src/repositories/app_repository.dart';
import 'package:betheheromobile/src/repositories/app_repository_interface.dart';
import 'package:betheheromobile/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IAppRepository>(create: (_) => AppRepository()),
        ChangeNotifierProvider<AppController>(
          create: (ctx) =>
              AppController(repository: ctx.read<IAppRepository>()),
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
