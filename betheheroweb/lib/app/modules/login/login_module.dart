import 'package:hasura_connect/hasura_connect.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../app_module.dart';
import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/logon/login_page_desktop.dart';
import 'pages/logon/login_page_mobile.dart';
import 'pages/register/register_page_desktop.dart';
import 'pages/register/register_page_mobile.dart';
import 'repositories/login_repository.dart';
import 'repositories/login_repository_interface.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i())),
        Bind<ILoginRepository>((i) => LoginRepository(i<HasuraConnect>())),
        Bind<HasuraConnect>((i) => AppModule.to.get<HasuraConnect>()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => ScreenTypeLayout(
            breakpoints:
                ScreenBreakpoints(desktop: 1050, tablet: 768, watch: 150),
            desktop: LoginPageDesktop(),
            mobile: LoginPageMobile(),
          ),
        ),
        Router(
          "/register",
          child: (_, args) => ScreenTypeLayout(
            breakpoints:
                ScreenBreakpoints(desktop: 1020, tablet: 768, watch: 150),
            desktop: RegisterPageDesktop(),
            mobile: RegisterPageMobile(),
          ),
        ),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
