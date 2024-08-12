
import 'package:shopzy_grocery_user/data/api/api_checker.dart';
import 'package:shopzy_grocery_user/data/model/response/banner_model.dart';
import 'package:shopzy_grocery_user/data/repository/banner_repo.dart';
import 'package:get/get.dart';

class BannerController extends GetxController implements GetxService {
  final BannerRepo bannerRepo;

  BannerController({required this.bannerRepo});

  List<Banner>? _bannerDataList;
  int _currentIndex = 0;
  bool _isLoading = false;

  List<Banner>? get bannerDataList => _bannerDataList;

  int get currentIndex => _currentIndex;

  bool get isLoading => _isLoading;

  Future<void> getBannerList() async {
    _isLoading = true;
    update();
    Response response = await bannerRepo.getBannerList();
    _isLoading = false;
    if (response.statusCode == 200) {
      _bannerDataList = [];
      _bannerDataList!.addAll(BannerModel.fromJson(response.body).banner!);
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }

  void setCurrentIndex(int index, {bool notify = false}) {
    _currentIndex = index;
    if (notify) {
      update();
    }
  }
}
