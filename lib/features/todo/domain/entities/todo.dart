class Todo {
  final String id;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final bool isCompleted;
  final String category;

  Todo({
    required this.id,
    required this.title,
    this.description,
    this.dueDate,
    this.isCompleted = false,
    required this.category,
  });
}
