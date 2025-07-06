class TaskModel {
  final String taskName;
  final String taskDescription;
  final bool isHighPriority;
  bool isDone;
  int id;

  TaskModel({
    required this.taskName,
    required this.taskDescription,
    required this.isHighPriority,
    required this.id,
    this.isDone = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskName: json['taskName'],
      taskDescription: json['taskDescription'],
      isHighPriority: json['isHighPriority'],
      isDone: json['isDone'] ?? false,
      id: json['id'] ?? 0,
    );
  }

  // Convert object to Map (for SharedPreferences)
  Map<String, dynamic> toJson() {
    return {
      'taskName': taskName,
      'taskDescription': taskDescription,
      'isHighPriority': isHighPriority,
      'isDone': isDone,
      'id': id,
    };
  }
}
