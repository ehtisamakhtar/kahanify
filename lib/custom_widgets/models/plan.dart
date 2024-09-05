class Plan {
  final String title;
  final String imageUrl;
  final String description;
  final String price;

  Plan({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      title: json['title'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: json['price'],
    );
  }
}
