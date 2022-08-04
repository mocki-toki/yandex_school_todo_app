import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_app/core/presentation/presentation.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final nagivator = AppNavigator();

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: nagivator,
      child: MaterialApp(
        navigatorKey: nagivator.key,
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
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: AppRoutes.taskList,
      ),
    );
  }
}
