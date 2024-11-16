import 'package:lab_2/domain/models/banner_model.dart';

abstract class BannerRepository {
  Future<BannerModel> fetchBanners(Map<String, dynamic> json);
}
