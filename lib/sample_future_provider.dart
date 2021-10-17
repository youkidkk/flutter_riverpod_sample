import 'package:hooks_riverpod/hooks_riverpod.dart';

final sampleFutureProvider = FutureProvider<String>((_) async {
  await Future.delayed(const Duration(seconds: 5));
  return "Sample future provider finished!";
});
