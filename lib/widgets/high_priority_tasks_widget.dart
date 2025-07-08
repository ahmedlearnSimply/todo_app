import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/core/models/task_model.dart';
import 'package:todo_app/core/util/color.dart';
import 'package:todo_app/screens/high_priority_screen.dart';
import 'package:todo_app/widgets/tasks_items.dart';

class HighPriorityTasksWidget extends StatelessWidget {
  HighPriorityTasksWidget({super.key, required this.tasks, required this.onTap});

  final Function(bool? value, int index) onTap;
  List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.surface, borderRadius: BorderRadius.circular(20)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, bottom: 8),
                  child: Text(
                    "High Priority Tasks",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'poppins',
                      color: AppColor.green,
                    ),
                  ),
                ),
                ...tasks.where((e) => e.isHighPriority).take(4).map((element) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Checkbox(
                          activeColor: AppColor.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          value: element.isDone,
                          onChanged: (bool? value) {
                            final indexInAllTasks = tasks.indexOf(element);
                            onTap(value, indexInAllTasks);
                          },
                        ),
                      ),
                      Expanded(
                        child: Text(
                          element.taskName,
                          style: TextStyle(
                            color: element.isDone ? Color(0xffA0A0A0) : AppColor.primaryText,
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,

                            overflow: TextOverflow.ellipsis,
                            decoration:
                                element.isDone ? TextDecoration.lineThrough : TextDecoration.none,
                            decorationColor: Color(0xffA0A0A0),
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Gap(10),
                    ],
                  );
                }),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HighPriorityScreen();
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 48,
                height: 56,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.surface,
                  border: Border.all(color: Color(0xff6E6E6E), width: 1),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: SvgPicture.asset("assets/images/arrow2.svg", width: 10, height: 10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
