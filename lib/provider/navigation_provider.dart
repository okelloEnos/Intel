import 'package:hooks_riverpod/hooks_riverpod.dart';

var bottomNavigationStateProvider = StateProvider.autoDispose((ref) => 0);

var previousNavigationStateProvider = StateProvider.autoDispose((ref) => 0);