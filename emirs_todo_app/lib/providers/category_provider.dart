import 'package:emirs_todo_app/utils/task_categories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategories>(
  (ref) {
    return TaskCategories.others;
  },
);
