import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CounterProvider extends InheritedWidget {
  final CounterBloc bloc;

  CounterProvider({Key? key, required Widget child, required this.bloc})
      : super(key: key, child: child);

  static CounterBloc? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CounterProvider>()?.bloc;

  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) =>
      oldWidget.bloc != bloc;
}

class CounterBloc extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    if (_counter < 10) {
      _counter++;
      notifyListeners();
    } else {
      // Show alert dialog
      // Note: To show the dialog, you might need to pass a BuildContext from the UI.
      // In this example, let's assume the UI is responsible for showing dialogs.
    }
  }

  void decrement() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    } else {
      // Show alert dialog
      // Note: To show the dialog, you might need to pass a BuildContext from the UI.
      // In this example, let's assume the UI is responsible for showing dialogs.
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: CounterProvider(
        bloc: CounterBloc(),
        child: CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = CounterProvider.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value: ${bloc.counter}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    bloc.increment();
                  },
                  child: Text('+'),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    bloc.decrement();
                  },
                  child: Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
