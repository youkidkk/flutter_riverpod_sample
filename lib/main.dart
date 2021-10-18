import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod_sample/counter_state.dart';
import 'package:flutter_riverpod_sample/counter_state_notifier.dart';
import 'package:flutter_riverpod_sample/sample_future_provider.dart';
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

    final sampleFuture = useProvider(sampleFutureProvider);

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
                OutlinedButton(
                  onPressed: counterStateNotifier.decrement,
                  child: Text(
                    '－',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    '${counterState.value}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                OutlinedButton(
                  onPressed: counterStateNotifier.increment,
                  child: Text(
                    '＋',
                    style: Theme.of(context).textTheme.headline6,
                  ),
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
                OutlinedButton(
                  onPressed: counterStateNotifier.decrementStep,
                  child: Text(
                    '－',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    '${counterState.step}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                OutlinedButton(
                  onPressed: counterStateNotifier.incrementStep,
                  child: Text(
                    '＋',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
            Text(
              'FutureProvider',
              style: Theme.of(context).textTheme.headline3,
            ),
            sampleFuture.when(
              data: (result) => Text(
                result,
                style: Theme.of(context).textTheme.headline4,
              ),
              loading: () => const CircularProgressIndicator(),
              error: (_error, _st) => const Text('Error'),
            )
          ],
        ),
      ),
    );
  }
}
