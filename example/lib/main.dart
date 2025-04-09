import 'src/imports.dart';

void main() => runApp(const MyApp());

////
class MyApp extends StatefulWidget {
  ///
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends StateX<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: MaterialController().groupValue!
            ? ThemeData.dark()
            : ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
        home: const MyHomePage(),
      );
}

///
class MyHomePage extends StatefulWidget {
  ///
  const MyHomePage({super.key});
  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends StateX<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('ui_widgets_utils Demo App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                key: const Key('showBox'),
                onPressed: () async {
                  final result = await showBox(
                    context: context,
                    text: 'This is a test.',
                    button01:
                        const Option(key: Key('OK'), text: 'OK', result: true),
                    button02: const Option(
                        key: Key('Cancel'), text: 'Cancel', result: false),
                    useMaterial: true,
                  );
                },
                child: const Text('showBox'),
              ),
              ElevatedButton(
                key: const Key('showDialogBox'),
                onPressed: () async {
                  final result = await showDialogBox<bool>(
                    context,
                    content: const Text('This is a test.'),
                    actions: [
                      TextButton(
                        key: const Key('OK'),
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                      TextButton(
                        key: const Key('Cancel'),
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                      ),
                    ],
                  );
                },
                child: const Text('showDialogBox'),
              ),
              ElevatedButton(
                key: const Key('dialogBox'),
                onPressed: () {
                  dialogBox(
                    context,
                    title: 'This is a test.',
                    button01:
                        const Option(key: Key('OK'), text: 'OK', result: true),
                    button02: const Option(
                        key: Key('Cancel'), text: 'Cancel', result: false),
                  );
                },
                child: const Text('dialogBox'),
              ),
              ElevatedButton(
                key: const Key('msgbox'),
                onPressed: () {
                  MsgBox(
                    context: context,
                    title: 'This is a test.',
                    actions: [
                      TextButton(
                        key: const Key('OK'),
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                      TextButton(
                        key: const Key('Cancel'),
                        style: TextButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.labelLarge,
                        ),
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                      ),
                    ],
                  ).show();
                },
                child: const Text('MsgBox'),
              ),
              ElevatedButton(
                key: const Key('classdialogbox'),
                onPressed: () {
                  DialogBox(
                    context: context,
                    title: 'This is a test.',
                    button01:
                        const Option(key: Key('OK'), text: 'OK', result: true),
                    button02: const Option(
                        key: Key('Cancel'), text: 'Cancel', result: false),
                  ).show();
                },
                child: const Text('DialogBox'),
              ),
              MaterialVersionRadioButtons(),
            ],
          ),
        ),
      );
}

///
class MaterialVersionRadioButtons extends RadioButtons<bool> {
  ///
  MaterialVersionRadioButtons({
    super.key,
    super.inChanged,
  }) : super(controller: MaterialController());

  @override
  Widget radioButtons(BuildContext context) {
    final radios = radioButtonsBuilder<bool>(
      {'Yes': true, 'No': false},
      controller,
      mainAxisSize: MainAxisSize.min,
    );
    final List<Widget> widgets = [const Text('Dark Mode')];
    widgets.addAll(radios);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }
}

///
class MaterialController extends RadioButtonsController<bool> {
  ///
  factory MaterialController() => _this ??= MaterialController._();
  MaterialController._() : super(initialValue: false);
  static MaterialController? _this;

  @override
  void onChanged(bool? v) {
    super.onChanged(v);
    // ignore: INVALID_USE_OF_PROTECTED_MEMBER
    StateSet.root?.setState(() {});
  }
}
