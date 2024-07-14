class Todo {
  final String id;
  final String description;
  final DateTime? completedAt;

  Todo(
      {required this.id, required this.description, required this.completedAt});

  bool get done {
    return completedAt != null;
  }

  Todo copyWith({
    String? id,
    String? descripcion,
    DateTime? completedAt
  }) => Todo(
    id: id ?? this.id, 
    description: description, 
   completedAt: completedAt
  );
}
