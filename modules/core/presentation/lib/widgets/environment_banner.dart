import 'package:core_domain/core_domain.dart';
import 'package:core_presentation/core_presentation.dart';

class EnvironmentBanner extends StatelessWidget {
  const EnvironmentBanner(
    this.environmentConfig, {
    super.key,
    required this.child,
  });

  final EnvironmentConfig environmentConfig;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (environmentConfig == EnvironmentConfig.production) return child;

    final colors = <EnvironmentConfig, Color>{
      EnvironmentConfig.debug: Colors.red,
      EnvironmentConfig.testing: Colors.lightBlue,
    };

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        message: environmentConfig.name.toUpperCase(),
        color: colors[environmentConfig]!,
        location: BannerLocation.topEnd,
        child: child,
      ),
    );
  }
}
