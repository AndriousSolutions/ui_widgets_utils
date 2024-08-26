import 'src/imports.dart';

import '../../lib/dialog_box.dart';

void main() => runApp(const MyApp());

////
class MyApp extends StatelessWidget {
  ///
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'ui_widgets_utils Demo App'),
      );
}

///
class MyHomePage extends StatefulWidget {
  ///
  const MyHomePage({super.key, required this.title});

  ///
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends StateX<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              key: const Key('showBox'),
              onPressed: () async {
                final result = await showBox(
                  context: App.context!,
                  text: 'This is a test.',
                  button01: Option(text: 'Stay', result: true),
                  button02: Option(text: 'New', result: false),
                );
              },
              child: const Text('showBox'),
            ),
            ElevatedButton(
              key: const Key('Page 1 Counter'),
              onPressed: () {},
              child: const Text('Page 1 Counter'),
            ),
            ElevatedButton(
              key: const Key('Page 1 Counter'),
              onPressed: () {},
              child: const Text('Page 1 Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
