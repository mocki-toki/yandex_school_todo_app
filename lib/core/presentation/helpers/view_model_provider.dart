import 'package:todo_app/core/infrastructure/infrastructure.dart';
import 'package:todo_app/core/presentation/presentation.dart';

typedef CreateProviderCallback<T> = T Function(
  BuildContext context,
  ServiceProvider provider,
);

T _createProvider<T>(
  CreateProviderCallback<T> create,
  BuildContext context,
) {
  return create(context, context.read<ServiceProvider>());
}

class ViewModelProvider<T extends BlocBase> extends BlocProvider<T> {
  ViewModelProvider(
    CreateProviderCallback<T> create, {
    super.key,
    super.child,
  }) : super(create: (context) => _createProvider(create, context));
}
