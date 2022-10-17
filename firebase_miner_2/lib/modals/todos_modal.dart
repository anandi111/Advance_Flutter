class Todos {
  final String title;
  final String content;

  Todos({required this.title, required this.content});

  factory Todos.fromMap({required Map<String, dynamic> data}) {
    return Todos(
        title: data["title"] ?? "Title", content: data["content"] ?? "Content");
  }
}

class Response {
  int? code;
  String? message;
  Response({this.code, this.message});
}
