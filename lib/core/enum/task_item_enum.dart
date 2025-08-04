enum TaskItemEnum {
  markAsDone(name: "Mark as Done"),
  edit(name: "Edit"),
  delete(name: "Delete");

  final String name;
  const TaskItemEnum({required this.name});
}
