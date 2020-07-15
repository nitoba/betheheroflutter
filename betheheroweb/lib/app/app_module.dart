import 'package:BeTheHeroWeb/app/app_widget.dart';
import 'package:BeTheHeroWeb/app/modules/home/home_module.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<HasuraConnect>((i) =>
            HasuraConnect("https://betheheroflutter.herokuapp.com/v1/graphql")),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: LoginModule()),
        Router("/home", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
