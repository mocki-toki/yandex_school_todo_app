import 'package:app_domain/app_domain.dart';
import 'package:app_presentation/app_presentation.dart';

class Application extends StatelessWidget {
  const Application({
    super.key,
    required this.environmentConfig,
  });

  final EnvironmentConfig environmentConfig;

  @override
  Widget build(BuildContext context) {
    final lightDesign = DesignData(
      styles: DesignStyles(palette: lightPalette),
    );

    final darkDesign = DesignData(
      styles: DesignStyles(palette: darkPalette),
    );

    return PlatformBrightnessBuilder(
      builder: (_, platformBrightness) {
        final currentDesign =
            platformBrightness == Brightness.light ? lightDesign : darkDesign;

        return Design(
          data: currentDesign,
          builder: (_, theme) {
            return EnvironmentBanner(
              environmentConfig,
              child: MaterialApp.router(
                routerDelegate: context.sp.getRequired<AppRouterDelegate>(),
                routeInformationParser: AppRouteInformationParser(),
                debugShowCheckedModeBanner: false,
                title: CorePresentationConstants.appName,
                theme: theme,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
              ),
            );
          },
        );
      },
    );
  }
}
