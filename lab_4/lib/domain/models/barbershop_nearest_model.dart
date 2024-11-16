class BarbershopNearestModel {
  final String name;
  final String locationWithDistance;
  final String image;
  final double reviewRate;

  BarbershopNearestModel({
    required this.name,
    required this.locationWithDistance,
    required this.image,
    required this.reviewRate,
  });

  factory BarbershopNearestModel.fromJson(Map<String, dynamic> json) {
    return BarbershopNearestModel(
      name: json['name'],
      locationWithDistance: json['location_with_distance'],
      image: json['image'],
      reviewRate: json['review_rate'].toDouble(),
    );
  }
}
