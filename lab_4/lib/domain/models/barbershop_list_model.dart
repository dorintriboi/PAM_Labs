class BarbershopListModel {
  final String name;
  final String locationWithDistance;
  final String image;
  final double reviewRate;

  BarbershopListModel({
    required this.name,
    required this.locationWithDistance,
    required this.image,
    required this.reviewRate,
  });

  factory BarbershopListModel.fromJson(Map<String, dynamic> json) {
    return BarbershopListModel(
      name: json['name'],
      locationWithDistance: json['location_with_distance'],
      image: json['image'],
      reviewRate: json['review_rate'].toDouble(),
    );
  }
}
