import 'package:flutter_test/flutter_test.dart';
import 'package:moniepoint_test/app/app.dart';
import 'package:moniepoint_test/home/views/pages/home.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
