import 'package:emirs_todo_app/config/routes/routes.dart';
import 'package:emirs_todo_app/providers/providers.dart';
import 'package:emirs_todo_app/utils/utils.dart';
import 'package:emirs_todo_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/task.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    final completedTasks = _completedTasks(taskState.tasks);
    final incompletedTasks = _incompletedTasks(taskState.tasks);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * .3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      text: 'Aug 7, 2023',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    DisplayWhiteText(
                      text: 'My Todo List',
                      fontSize: 35,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DisplayListOfTasks(
                    tasks: incompletedTasks,
                  ),
                  const Gap(20),
                  Text(
                    'Completed',
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap(20),
                  DisplayListOfTasks(
                    tasks: completedTasks,
                    isCompletedTasks: true,
                  ),
                  const Gap(20),
                  ElevatedButton(
                    onPressed: () => context.push(RouteLocation.createTask),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DisplayWhiteText(text: 'Add New Task'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> _completedTasks(List<Task> tasks) {
    final List<Task> filteredTasks = [];
    for (var task in tasks) {
      if (task.isCompleted) {
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }

  List<Task> _incompletedTasks(List<Task> tasks) {
    final List<Task> filteredTasks = [];
    for (var task in tasks) {
      if (!task.isCompleted) {
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }
}
