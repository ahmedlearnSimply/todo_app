import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/enum/task_item_enum.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/services/app_local_storage.dart';
import 'package:todo_app/core/theme/theme_controller.dart';
import 'package:todo_app/core/util/color.dart';

class TasksItems extends StatefulWidget {
  TasksItems({
    super.key,
    required this.tasks,
    required this.isLoading,
    required this.onTap,
    this.emptyMessage,
    required this.onDelete,
  });

  List<TaskModel> tasks = [];
  bool isLoading = false;
  final Function(bool? value, int index) onTap;
  String? emptyMessage;
  final void Function(int id)? onDelete;

  @override
  State<TasksItems> createState() => _TasksItemsState();
}

class _TasksItemsState extends State<TasksItems> {
  void doneTasks(bool? value, int index) async {
    setState(() {
      widget.tasks[index].isDone = value ?? false;
    });
    await saveUpdatedTasks();
  }

  Future<void> saveUpdatedTasks() async {
    final updatedTasks =
        widget.tasks.map((element) => element.toJson()).toList();
    AppLocalStorage.setString('tasks', jsonEncode(updatedTasks));
    // calculateIndicator();
  }

  void _loadTask() async {
    setState(() {
      widget.isLoading = true;
    });

    final finalTask = AppLocalStorage.getString('tasks');
    if (finalTask != null) {
      final taskAfterDecode = jsonDecode(finalTask) as List<dynamic>;

      setState(() {
        widget.tasks =
            taskAfterDecode.map((e) => TaskModel.fromJson(e)).toList();
        final completedTasks =
            widget.tasks.where((element) => element.isDone).toList();
      });
      setState(() {
        widget.isLoading = false;
      });
    }
  }

  void deleteTask(int id) async {
    setState(() {
      widget.tasks.removeWhere((task) => task.id == id);
    });

    await saveUpdatedTasks();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tasks.isEmpty && !widget.isLoading) {
      return Center(
        child: Text(
          widget.emptyMessage ?? "No Task Found",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 26),
        ),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 50),
      separatorBuilder: (BuildContext context, int index) => Gap(8),
      itemCount: widget.tasks.length,
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
                    value: widget.tasks[index].isDone,

                    onChanged: (bool? value) {
                      widget.onTap(value, index);
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
                        widget.tasks[index].taskName,
                        //!-----//
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium!.copyWith(
                          color:
                              widget.tasks[index].isDone
                                  ? Theme.of(context).disabledColor
                                  : Theme.of(context).hintColor,
                          overflow: TextOverflow.ellipsis,
                          decoration:
                              widget.tasks[index].isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                          decorationColor: Theme.of(context).disabledColor,
                        ),
                        maxLines: 1,
                      ),
                      if (widget.tasks[index].taskDescription != "")
                        Text(
                          widget.tasks[index].taskDescription,
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
                PopupMenuButton<TaskItemEnum>(
                  itemBuilder:
                      (context) =>
                          TaskItemEnum.values.map((e) {
                            return PopupMenuItem(
                              value: e,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text(e.name), Divider()],
                              ),
                            );
                          }).toList(),
                  //!---------------4-8-2025-----------------//
                  onSelected: (value) {
                    switch (value) {
                      case TaskItemEnum.markAsDone:
                        bool newValue = !widget.tasks[index].isDone;
                        doneTasks(newValue, index);
                        break;
                      case TaskItemEnum.edit:
                        print("Edit");
                        break;
                      case TaskItemEnum.delete:
                        widget.onDelete;
                        break;
                    }
                  },
                  child: Icon(
                    Icons.more_vert,
                    color:
                        widget.tasks[index].isDone
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
