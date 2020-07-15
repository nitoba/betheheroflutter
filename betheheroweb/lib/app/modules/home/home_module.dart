import 'package:betheheroweb/app/app_module.dart';
import 'package:betheheroweb/app/modules/home/pages/create_incident/create_incident_desktop_page.dart';
import 'package:betheheroweb/app/modules/home/pages/create_incident/create_incident_mobile_page.dart';
import 'package:betheheroweb/app/modules/home/repositories/home_repository.dart';
import 'package:betheheroweb/app/modules/home/repositories/home_repository_interface.dart';
import 'package:hasura_connect/hasura_connect.dart';

import 'pages/create_incident/create_incident_controller.dart';
import 'package:betheheroweb/app/modules/home/pages/home_profile/home_controller.dart';
import 'package:betheheroweb/app/modules/home/pages/home_profile/home_page_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/home_profile/home_page_mobile.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CreateIncidentController(i<IHomeRepository>())),
        Bind((i) => HomeController(i<IHomeRepository>())),
        Bind<IHomeRepository>((i) => HomeRepository(i<HasuraConnect>())),
        Bind<HasuraConnect>((i) => AppModule.to.get<HasuraConnect>()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => ScreenTypeLayout(
            breakpoints:
                ScreenBreakpoints(desktop: 1020, tablet: 768, watch: 150),
            desktop: HomePageDesktop(
              ongID: args.data['ongId'],
              ongName: args.data["ongName"],
            ),
            mobile: HomePageMobile(
              ongID: args.data['ongId'],
              ongName: args.data["ongName"],
            ),
          ),
        ),
        Router(
          "/newIncident",
          child: (_, args) => ScreenTypeLayout(
            breakpoints:
                ScreenBreakpoints(desktop: 1020, tablet: 768, watch: 150),
            desktop: CreateIncidentDesktopPage(
              ongId: args.data,
            ),
            mobile: CreateIncidentMobilePage(
              ongId: args.data,
            ),
          ),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
