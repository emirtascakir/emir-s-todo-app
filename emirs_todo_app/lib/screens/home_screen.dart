import 'package:emirs_todo_app/config/routes/routes.dart';
import 'package:emirs_todo_app/data/data.dart';
import 'package:emirs_todo_app/utils/utils.dart';
import 'package:emirs_todo_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
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
                  const DisplayListOfTasks(tasks: [
                    Task(
                        title: 'title1',
                        note: 'aaa',
                        time: 'bbbb',
                        date: 'ccc',
                        category: TaskCategories.health,
                        isCompleted: false),
                    Task(
                        title: 'title1',
                        note: 'aaa',
                        time: 'bbbb',
                        date: 'ccc',
                        category: TaskCategories.education,
                        isCompleted: false),
                    Task(
                        title: 'title3',
                        note: 'aaa',
                        time: 'bbbb',
                        date: 'ccc',
                        category: TaskCategories.social,
                        isCompleted: false),
                  ]),
                  const Gap(20),
                  Text(
                    'Completed',
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap(20),
                  const DisplayListOfTasks(tasks: [
                    Task(
                        title: 'title1',
                        note: 'aaa',
                        time: 'bbbb',
                        date: 'ccc',
                        category: TaskCategories.education,
                        isCompleted: true),
                    Task(
                        title: 'title2',
                        note: 'aaa',
                        time: 'bbbb',
                        date: 'ccc',
                        category: TaskCategories.work,
                        isCompleted: true),
                  ], isCompletedTasks: true),
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
}
