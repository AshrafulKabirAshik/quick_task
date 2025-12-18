class TaskModel {
  String id;
  String title;
  String? description;
  bool isCompleted;
  DateTime createdAt;
  DateTime? dueDate;
  int priority;

  TaskModel({required this.id, required this.title, this.description, this.isCompleted = false, DateTime? createdAt, this.dueDate, this.priority = 1})
    : createdAt = createdAt ?? DateTime.now();


  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      priority: json['priority'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
      'priority': priority,
    };
  }


  TaskModel copyWith({String? id, String? title, String? description, bool? isCompleted, DateTime? createdAt, DateTime? dueDate, int? priority}) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      dueDate: dueDate ?? this.dueDate,
      priority: priority ?? this.priority,
    );
  }
}
