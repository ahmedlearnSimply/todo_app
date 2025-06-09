class TaskModel {
  final String taskName;
  final String taskDescription;
  final bool isHighPriority;

  TaskModel({
    required this.taskName,
    required this.taskDescription,
    required this.isHighPriority,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskName: json['taskName'],
      taskDescription: json['taskDescription'],
      isHighPriority: json['isHighPriority'],
    );
  }

  // Convert object to Map (for SharedPreferences)
  Map<String, dynamic> toJson() {
    return {
      'taskName': taskName,
      'taskDescription': taskDescription,
      'isHighPriority': isHighPriority,
    };
  }
}
