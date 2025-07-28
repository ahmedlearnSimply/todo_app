import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/theme/theme_controller.dart';
import 'package:todo_app/core/util/color.dart';

class TasksItems extends StatelessWidget {
  TasksItems({
    super.key,
    required this.tasks,
    required this.isLoading,
    required this.onTap,
    this.emptyMessage,
  });

  List<TaskModel> tasks = [];
  bool isLoading = false;
  final Function(bool? value, int index) onTap;
  String? emptyMessage;
  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty && !isLoading) {
      return Center(
        child: Text(
          emptyMessage ?? "No Task Found",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 26),
        ),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 50),
      separatorBuilder: (BuildContext context, int index) => Gap(8),
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: 72,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color:
                    ThemeController.valueNotifier.value == ThemeMode.dark
                        ? AppColor.background
                        : Color(0xffD1DAD6),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Checkbox(
                    activeColor: AppColor.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    value: tasks[index].isDone,

                    onChanged: (bool? value) {
                      onTap(value, index);
                    },
                  ),
                ),
                Gap(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tasks[index].taskName,
                        //!-----//
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(
                          color:
                              tasks[index].isDone
                                  ? Theme.of(context).disabledColor
                                  : Theme.of(context).hintColor,
                          overflow: TextOverflow.ellipsis,
                          decoration:
                              tasks[index].isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                          decorationColor: Theme.of(context).disabledColor,
                        ),
                        maxLines: 1,
                      ),
                      if (tasks[index].taskDescription != "")
                        Text(
                          tasks[index].taskDescription,
                          style:
                              Theme.of(
                                context,
                              ).textTheme.titleSmall!.copyWith(),

                          maxLines: 1,
                        ),
                    ],
                  ),
                ),

                Gap(12),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color:
                        tasks[index].isDone
                            ? Theme.of(context).cardColor
                            : Theme.of(context).primaryColorDark,
                  ),
                ),
                Gap(5),
              ],
            ),
          ),
        );
      },
    );
  }
}
