import 'package:core_presentation/core_presentation.dart';

class BlocInputProvider<T extends BlocBase, Input> extends StatefulWidget {
  final Input input;
  final T Function(BuildContext, Input) create;
  final Widget child;

  BlocInputProvider({
    super.key,
    required this.input,
    required this.create,
    required this.child,
  });

  @override
  _BlocInputProviderState<T, Input> createState() =>
      _BlocInputProviderState<T, Input>();
}

class _BlocInputProviderState<T extends BlocBase, Input>
    extends State<BlocInputProvider<T, Input>> {
  late T _bloc;

  @override
  void initState() {
    super.initState();
    _createCubit();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BlocInputProvider<T, Input> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.input != oldWidget.input) {
      _bloc.close();

      _createCubit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>.value(
      value: _bloc,
      child: widget.child,
    );
  }

  void _createCubit() {
    _bloc = widget.create(context, widget.input);
  }
}
