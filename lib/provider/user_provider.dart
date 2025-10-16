import 'package:flutter_riverpod/legacy.dart';
import 'package:movie_tickets/models/user.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
String greeting(Ref ref) {
  return 'Hello from Riverpod Generator!';
}