class BannerModel {
  final String image;
  final String buttonTitle;

  BannerModel({required this.image, required this.buttonTitle});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      image: json['image'],
      buttonTitle: json['button_title'],
    );
  }
}
