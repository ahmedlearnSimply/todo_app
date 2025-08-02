enum TaskItemEnum {
  delete(name: "Delete"),
  edit(name: "Edit"),
  markAsDone(name: "Mark as Done");

  final String name;
  const TaskItemEnum({required this.name});
}
