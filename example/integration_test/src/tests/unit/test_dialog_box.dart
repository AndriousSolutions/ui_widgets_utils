/// Copyright 2024 Andrious Solutions Ltd. All rights reserved.
/// Use of this source code is governed by a 2-clause BSD License.
/// The main directory contains that LICENSE file.
///
///          Created 26 August, 2024
///

//
import '../../_test_imports.dart';

void testDialogBoxes(WidgetTester tester) {
  testShowBox(tester);
  testDialogBox(tester);
}

Future<void> testShowBox(WidgetTester tester) async {
  //
//  test('Test ShowBox', () async {});
  final result = await showBox(
    context: const MyHomePage().state!.context,
    text: 'This is a test.',
    button01: const Option(text: 'Stay', result: true),
    button02: const Option(text: 'New', result: false),
    useMaterial: true,
  );
}

void testDialogBox(WidgetTester tester) {
  //
//  test('Test DialogBox', () async {});
  dialogBox(
    const MyHomePage().state!.context,
    title: 'This is a test.',
    button01: OKOption(),
    button02: CancelOption(),
    press01: () {},
    press02: () {},
    barrierDismissible: true,
    switchButtons: true,
  );

  MsgBox(
    context: const MyHomePage().state!.context,
  );
}
