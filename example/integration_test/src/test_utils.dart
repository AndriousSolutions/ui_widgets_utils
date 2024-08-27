//
import '_test_imports.dart';

//
String _errorMessage = '';

void collectError(Object error) {
  //
  _errorMessage = '$_errorMessage${error.toString()}';
}

/// Throw an Exception if there are a collection of errors.
void reportTestErrors() {
  //
  if (_errorMessage.isNotEmpty) {
    //
    throw Exception(_errorMessage);
  }
}

// Generic Dialog tester
Future<void> testDialog(WidgetTester tester, String key,
    {String? closeKey, String? location}) async {
  //
  closeKey ??= 'Cancel';

  location ??= '';

  //
  var finder = find.byKey(Key(key));

  // Tap that button.
  if (finder.evaluate().isNotEmpty) {
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  //
  finder = find.byKey(Key(closeKey));

  // Tap that button.
  if (finder.evaluate().isNotEmpty) {
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }
}
