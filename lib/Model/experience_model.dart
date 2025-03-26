class Experience {
  final int id;
  final String place;
  final String activity;
  final String description;
  final double price;
  final String imageName;
  final String sliderImageName;

  Experience({
    required this.id,
    required this.place,
    required this.activity,
    required this.description,
    required this.price,
    required this.imageName,
    required this.sliderImageName,
  });

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      id: map['id'] as int,
      place: map['place'] as String,
      activity: map['activity'] as String,
      description: map['description'] as String,
      price: (map['price'] as num).toDouble(),
      imageName: map['image_name'] as String? ?? "",
      sliderImageName: map['slider_image_name'] as String? ?? "",
    );
  }

  // Convert Experience object to Map (for Supabase insertion)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'place': place,
      'activity': activity,
      'description': description,
      'price': price,
      'image_name': imageName,
      'slider_image_name': sliderImageName
    };
  }

  // Convert a list of maps (from Supabase) to a list of Experience objects
  static List<Experience> fromList(List<Map<String, dynamic>> dataList) {
    return dataList.map((data) => Experience.fromMap(data)).toList();
  }

  // CopyWith method to update specific fields
  Experience copyWith({
    int? id,
    String? place,
    String? activity,
    String? description,
    double? price,
    String? imageName,
    String? sliderImageName,
  }) {
    return Experience(
      id: id ?? this.id,
      place: place ?? this.place,
      activity: activity ?? this.activity,
      description: description ?? this.description,
      price: price ?? this.price,
      imageName: imageName ?? this.imageName,
      sliderImageName: sliderImageName ?? this.sliderImageName,
    );
  }
}
