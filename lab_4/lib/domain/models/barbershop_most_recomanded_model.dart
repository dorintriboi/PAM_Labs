class BarbershopMostRecomandedModel {
  final String name;
  final String locationWithDistance;
  final String image;
  final double reviewRate;

  BarbershopMostRecomandedModel({
    required this.name,
    required this.locationWithDistance,
    required this.image,
    required this.reviewRate,
  });

  factory BarbershopMostRecomandedModel.fromJson(Map<String, dynamic> json) {
    return BarbershopMostRecomandedModel(
      name: json['name'],
      locationWithDistance: json['location_with_distance'],
      image: json['image'],
      reviewRate: json['review_rate'].toDouble(),
    );
  }
}
