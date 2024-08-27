/// Copyright 2024 Andrious Solutions Ltd. All rights reserved.
/// Use of this source code is governed by a 2-clause BSD License.
/// The main directory contains that LICENSE file.
///
///          Created 26 August, 2024
///

//
import '../../_test_imports.dart';

void testSimpleBottomAppBar(WidgetTester tester) {
  //
//  test('Test SimpleBottomAppBar', () async {});
  SimpleBottomAppBar(
    button01: HomeBarButton(),
    button02: DeleteBarButton(),
    button03: EditBarButton(),
    button04: SearchBarButton(),
  );
}
