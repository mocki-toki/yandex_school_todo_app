import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:task_presentation/task_presentation.dart';

import 'package:todo_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Creating new tesk', (tester) async {
    await app.main();

    await waitSec(3);
    await tester.pumpAndSettle();

    await waitSec(3);
    await tester.pumpAndSettle();

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.text('My Tasks'), findsOneWidget);

    await waitSec(3);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    final text = 'test text ' * 10;

    await tester.enterText(
      find.byType(TextField),
      text,
    );

    await waitSec(3);

    await tester.tap(find.byType(TextButton).first);
    await tester.pumpAndSettle();

    await waitSec(3);

    await tester.pumpAndSettle();
    expect(find.text(text), findsWidgets);
  });
}

Future<void> waitSec(int seconds) => Future.delayed(Duration(seconds: seconds));
