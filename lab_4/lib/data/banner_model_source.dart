import '../../domain/repositories/banner_repository.dart';
import '../domain/models/banner_model.dart';

class BannerModelDataSource implements BannerRepository {
  @override
  Future<BannerModel> fetchBanners(Map<String, dynamic> json) async {
    return BannerModel.fromJson(json['banner']);
  }
}
