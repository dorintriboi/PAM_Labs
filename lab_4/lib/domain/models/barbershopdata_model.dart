import 'package:lab_2/data/banner_model_source.dart';
import 'package:lab_2/data/barbershop_list_model_source.dart';
import 'package:lab_2/data/barbershop_most_recomanded_model_source.dart';
import 'package:lab_2/data/barbershop_nearest_model_source.dart';
import 'package:lab_2/domain/models/banner_model.dart';
import 'package:lab_2/domain/models/barbershop_list_model.dart';
import 'package:lab_2/domain/models/barbershop_most_recomanded_model.dart';
import 'package:lab_2/domain/models/barbershop_nearest_model.dart';

class BarberShopData {
  final BannerModel banner;
  final List<BarbershopNearestModel> nearestBarbershops;
  final List<BarbershopListModel> list;
  final List<BarbershopMostRecomandedModel> mostRecomanded;

  BarberShopData({
    required this.banner,
    required this.nearestBarbershops,
    required this.list,
    required this.mostRecomanded,
  });

  static Future<BarberShopData> fromJson(Map<String, dynamic> json) async {
    final banner = await BannerModelDataSource().fetchBanners(json);
    final barberShopList =
        await BarbershopListModelSource().fetchBarbershopList(json);
    final barberShopNearestList =
        await BarbershopNearestModelSource().fetchBarbershopNearest(json);
    final barberShopMostRecomanded = await BarbershopMostRecomandedModelSource()
        .fetchBarbershopMostRecomanded(json);

    return BarberShopData(
      banner: banner,
      nearestBarbershops: barberShopNearestList,
      list: barberShopList,
      mostRecomanded: barberShopMostRecomanded,
    );
  }
}
