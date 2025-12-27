class TraditionItem {
  final String title;
  final String description;

  TraditionItem({required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {'title': title, 'description': description};
  }

  factory TraditionItem.fromMap(Map<String, dynamic> map) {
    return TraditionItem(title: map['title'], description: map['description']);
  }
}
