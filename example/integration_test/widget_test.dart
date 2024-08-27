//
import 'src/_test_imports.dart';

//
import 'package:integration_test/integration_test.dart'
    show IntegrationTestWidgetsFlutterBinding;

void main() => integrationTesting();

void integrationTesting() {
  //
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    /// Allows for SharedPreferences to be ready for testing.
    SharedPreferences.setMockInitialValues({});
  });

  /// Runs after EACH test or group
  tearDown(() {});

  /// Define a test. The TestWidgets function also provides a WidgetTester
  /// to work with. The WidgetTester allows you to build and interact
  /// with widgets in the test environment.
  testWidgets('testing example app', (WidgetTester tester) async {
    //
    /// Flutter won’t automatically rebuild your widget in the test environment.
    /// Use pump() or pumpAndSettle() to ask Flutter to rebuild the widget.
    await tester.pumpWidget(const MyApp());

    /// pumpAndSettle() waits for all animations to complete.
    await tester.pumpAndSettle();

    await testDialog(tester, 'showBox', location: 'test_page1.dart');

    await testDialog(tester, 'showDialogBox', location: 'test_page1.dart');

    await testDialog(tester, 'dialogBox',
        closeKey: 'button012', location: 'test_page1.dart');

    await testDialog(tester, 'msgbox', location: 'test_page1.dart');

    await testDialog(tester, 'classdialogbox',
        closeKey: 'button02', location: 'test_page1.dart');

    reportTestErrors();
  });

  // /// Define a test. The TestWidgets function also provides a WidgetTester
  // /// to work with. The WidgetTester allows you to build and interact
  // /// with widgets in the test environment.
  // testWidgets('testing example app', (WidgetTester tester) async {
  //   //
  //
  //   /// Flutter won’t automatically rebuild your widget in the test environment.
  //   /// Use pump() or pumpAndSettle() to ask Flutter to rebuild the widget.
  //   await tester.pumpWidget(const MyApp());
  //
  //   /// pumpAndSettle() waits for all animations to complete.
  //   await tester.pumpAndSettle();
  //
  //   testCustomRaisedButton(tester);
  //
  //   testSnappingListScrollPhysics(tester);
  //
  //   testDialogBoxes(tester);
  //
  //   testISOSpinner(tester);
  //
  //   testNavBottomBar(tester);
  //
  //   testSetOrientationLandscapeOnly(tester);
  //
  //   testSimpleBottomAppBar(tester);
  //
  //   testTabButtons(tester);
  //
  //   testVarStr(tester);
  //
  //   reportTestErrors();
  // });
}
