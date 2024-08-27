/// Copyright 2024 Andrious Solutions Ltd. All rights reserved.
/// Use of this source code is governed by a 2-clause BSD License.
/// The main directory contains that LICENSE file.
///
///          Created 26 August, 2024
///

//
import '../../_test_imports.dart';

const _location = '========================== drawer_dialog_tests.dart';

//
Future<void> dialogTests(WidgetTester tester) async {
  // Programmatically open the Drawer
  final ScaffoldState state = tester.firstState(find.byType(Scaffold));

  expect(state, isNotNull, reason: _location);

  state.openDrawer();

  await tester.pumpAndSettle();

  if (state.isDrawerOpen) {
    //
    await _openDialogWindow('Show Box', tester);

    await _openDialogWindow('Dialog Box', tester);

    await _openDialogWindow('Message Box', tester);

    Navigator.pop(state.context);

    await tester.pumpAndSettle();
  }
}

/// Open a particular type of dialog window.
Future<void> _openDialogWindow(String key, WidgetTester tester) async {
  //
  var finder = find.byKey(Key(key));

  expect(finder, findsOneWidget, reason: _location);

  await tester.tap(finder);

  await tester.pumpAndSettle(const Duration(milliseconds: 200));

  finder = find.byKey(const Key('button01'));

  if (finder.evaluate().isNotEmpty) {
    await tester.tap(finder);
    await tester.pumpAndSettle(const Duration(milliseconds: 200));
  }
}
