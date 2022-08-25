import 'package:app_presentation/app_presentation.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: context.sp.getRequired<AppRouterDelegate>(),
      routeInformationParser: AppRouteInformationParser(),
      debugShowCheckedModeBanner: false,
      title: CorePresentationConstants.appName,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
