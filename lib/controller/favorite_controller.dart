import 'package:shopzy_grocery_user/data/api/api_checker.dart';
import 'package:shopzy_grocery_user/data/model/response/favrouiteProduct_model.dart';
import 'package:shopzy_grocery_user/data/repository/favorite_repo.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';

class FavoriteController extends GetxController implements GetxService {
  final FavroiteRepo favroiteRepo;
  FavoriteController({required this.favroiteRepo});

  List<int>_favProductIdList = [];
  List<FavoriteProducts>? _favoriteProducts;
  bool _isLoading = false;
  List<int>? get favProductIdList => _favProductIdList;
  List<FavoriteProducts>?get favoriteProducts=>_favoriteProducts;
  bool get isLoading => _isLoading;

  void addToFavList(int? productId) async {
    Response response = await favroiteRepo.addFavoriteList(productId);
    if (response.statusCode == 200) {
      _favProductIdList.add(productId!);
      showCustomSnackBar(response.body?['message'], isError: false);
      }
    else {
      ApiChecker.checkApi(response);
    }
    update();
  }
  void removeFromFavList(int id) async {
    Response response = await favroiteRepo.removeFavouriteList(id);
    if (response.statusCode == 200) {
      int idIndex = -1;
      idIndex = _favProductIdList.indexOf(id);
      _favProductIdList.removeAt(idIndex);
      showCustomSnackBar(response.body['message'], isError: false);
    } else {
      ApiChecker.checkApi(response);
    }
    update();
  }
  Future<void> getList(int) async {
    _isLoading = true;

    Response response = await favroiteRepo.getFavoriteList(0);
   if(response.statusCode==200){
     _favoriteProducts=[];
     _favoriteProducts!.addAll(FavoriteProductsModel.fromJson(response.body).favoriteProducts!);
   }else{
     ApiChecker.checkApi(response);
   }
   _isLoading = false;
    update();

  }

void removeFavourite() {
  _favProductIdList = [];

}
}




