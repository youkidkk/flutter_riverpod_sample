import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod_sample/counter_state.dart';
import 'package:flutter_riverpod_sample/counter_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterStateNotifierProvider =
    StateNotifierProvider<CounterStateNotifier, CounterState>(
        (ref) => CounterStateNotifier());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterState = useProvider(counterStateNotifierProvider);
    final counterStateNotifier =
        useProvider(counterStateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Riverpod Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter',
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: counterStateNotifier.decrement,
                  child: const Text('－'),
                ),
                Text(
                  '${counterState.value}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                  onPressed: counterStateNotifier.increment,
                  child: const Text('＋'),
                ),
              ],
            ),
            Text(
              'Step',
              style: Theme.of(context).textTheme.headline3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: counterStateNotifier.decrementStep,
                  child: const Text('－'),
                ),
                Text(
                  '${counterState.step}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                  onPressed: counterStateNotifier.incrementStep,
                  child: const Text('＋'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
